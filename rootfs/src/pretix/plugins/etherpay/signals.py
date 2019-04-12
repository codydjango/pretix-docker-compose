import json
from collections import OrderedDict

from django import forms
from django.dispatch import receiver

from pretix.base.settings import settings_hierarkey
from pretix.base.signals import (
    logentry_display, 
    register_global_settings, 
    register_payment_providers,
    requiredaction_display,
)

@receiver(register_payment_providers, dispatch_uid="payment_stripe")
def register_payment_provider(sender, **kwargs):
    from .payment import Etherpay

    return Etherpay

