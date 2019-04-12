from django.apps import AppConfig
from django.utils.functional import cached_property
from django.utils.translation import ugettext_lazy as _

from pretix import __version__ as version


class EtherpayApp(AppConfig):
    name = 'pretix.plugins.etherpay'
    verbose_name = _("Etherpay")

    def ready(self):
        from . import signals  # NOQA

    class PretixPluginMeta:
        name = _("Etherpay")
        author = _("Cody Django")
        version = "0.0.1"
        visible = True
        restricted = False
        description = _("This plugin allows you to receive ether payments via " +
                        "a deployed ethereum contract")

default_app_config = 'pretix.plugins.etherpay.EtherpayApp'

