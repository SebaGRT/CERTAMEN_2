from django.contrib import admin

from .models import (
    Categories,
    Colors,
    Customers,
    Locations,
    PaymentMethods,
    Products,
    Promotions,
    Seasons,
    ShippingTypes,
    Sizes,
    Transactions,
)

# Register your models here.

admin.site.register(Categories)
admin.site.register(PaymentMethods)
admin.site.register(ShippingTypes)
admin.site.register(Promotions)
admin.site.register(Locations)
admin.site.register(Sizes)
admin.site.register(Colors)
admin.site.register(Seasons)
admin.site.register(Customers)
admin.site.register(Products)
admin.site.register(Transactions)
