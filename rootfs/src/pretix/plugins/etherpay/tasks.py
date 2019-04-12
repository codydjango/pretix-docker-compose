import logging
from urllib.parse import urlsplit

from django.conf import settings

from pretix.base.models import Event
from pretix.celery_app import app
from pretix.multidomain.urlreverse import get_domain

logger = logging.getLogger(__name__)
