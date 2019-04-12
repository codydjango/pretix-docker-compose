import json
import textwrap
from collections import OrderedDict

from django import forms
from django.core.exceptions import ValidationError
from django.http import HttpRequest
from django.template.loader import get_template
from django.utils.translation import ugettext_lazy as _
from i18nfield.fields import I18nFormField, I18nTextarea
from i18nfield.strings import LazyI18nString

from pretix.base.models import OrderPayment
from pretix.base.payment import BasePaymentProvider


class Etherpay(BasePaymentProvider):
    identifier = 'etherpay'
    verbose_name = _('Etherpay')

    @property
    def settings_form_fields(self):
        return OrderedDict(list(super().settings_form_fields.items()) + [
            ('network_type', forms.ChoiceField(
                label=_('Ethereum network'),
                widget=forms.RadioSelect,
                choices=(
                    ('mainnet', _('Mainnet')),
                    ('ropsten', _('Ropsten')),
                ),
                initial='mainnet',
                required=True
            )),
            ('contract_address', forms.CharField(
                label=_('Contract address'),
                widget=forms.TextInput,
                required=True
            )),
            ('contract_abi', forms.CharField(
                label=_('Contract ABI'),
                widget=forms.TextArea,
                required=True
            ))
        ])

    def payment_form_render(self, request) -> str:
        template = get_template('pretixplugins/etherpay/checkout_payment_form.html')
        ctx = {
            'request': request,
            'event': self.event,
            'settings': self.settings
        }
        return template.render(ctx)

    def checkout_prepare(self, request, total):
        return True

    def payment_prepare(self, request: HttpRequest, payment: OrderPayment):
        return True

    def payment_is_valid_session(self, request):
        return True

    def checkout_confirm_render(self, request):
        return self.payment_form_render(request)

    def payment_pending_render(self, request: HttpRequest, payment: OrderPayment):
        template = get_template('pretixplugins/etherpay/pending.html')
        ctx = {
            'event': self.event,
            'code': payment.order.full_code,
            'order': payment.order,
            'amount': payment.amount,
            'settings': self.settings
        }
        return template.render(ctx)

    def payment_control_render(self, request: HttpRequest, payment: OrderPayment) -> str:
        template = get_template('pretixplugins/etherpay/control.html')
        ctx = {
            'request': request, 
            'event': self.event,
            'code': payment.order.full_code,
            'payment_info': payment.info_data, 
            'order': payment.order
        }
        return template.render(ctx)