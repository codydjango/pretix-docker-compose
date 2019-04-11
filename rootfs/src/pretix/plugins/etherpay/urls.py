from django.conf.urls import include, url

from pretix.multidomain import event_url

from .views import (
    etherpay_test,
    # ReturnView, oauth_return,
    # redirect_view, webhook,
)

event_patterns = [
    url(r'^etherpay/', include([
        url(r'^test/$', etherpay_test, name='etherpaytest'),
        url(r'^redirect/$', redirect_view, name='redirect'),
    ]))
    # url(r'^stripe/', include([
    #     event_url(r'^webhook/$', webhook, name='webhook', require_live=False),
    #     url(r'^redirect/$', redirect_view, name='redirect'),
    #     url(r'^return/(?P<order>[^/]+)/(?P<hash>[^/]+)/(?P<payment>[0-9]+)/$', ReturnView.as_view(), name='return'),
    # ])),
]

organizer_patterns = [

]

urlpatterns = [
    # url(r'^_stripe/webhook/$', webhook, name='webhook'),
    # url(r'^_stripe/oauth_return/$', oauth_return, name='oauth.return'),
]
