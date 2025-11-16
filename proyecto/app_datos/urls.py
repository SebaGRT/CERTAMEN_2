from django.urls import path

from . import views

urlpatterns = [
    path("", views.dashboard_home, name="dashboard_home"),
    # Shopping Trends URLs
    path(
        "shopping/histograma-poder-adquisitivo/",
        views.histograma_poder_adquisitivo,
        name="histograma_poder_adquisitivo",
    ),
    path("shopping/histograma-edad/", views.histograma_edad, name="histograma_edad"),
    path(
        "shopping/clientes-por-genero/",
        views.clientes_por_genero,
        name="clientes_por_genero",
    ),
    path("shopping/metodos-pago/", views.metodos_pago, name="metodos_pago"),
    path(
        "shopping/frecuencia-compras/",
        views.frecuencia_compras,
        name="frecuencia_compras",
    ),
    path("shopping/edad-vs-monto/", views.edad_vs_monto, name="edad_vs_monto"),
    path(
        "shopping/poder-adquisitivo-genero/",
        views.poder_adquisitivo_genero,
        name="poder_adquisitivo_genero",
    ),
    path(
        "shopping/categoria-vs-monto/",
        views.categoria_vs_monto,
        name="categoria_vs_monto",
    ),
    path(
        "shopping/metodo-pago-vs-monto/",
        views.metodo_pago_vs_monto,
        name="metodo_pago_vs_monto",
    ),
    path(
        "shopping/temporada-vs-cantidad/",
        views.temporada_vs_cantidad,
        name="temporada_vs_cantidad",
    ),
    path(
        "shopping/ubicacion-vs-cantidad/",
        views.ubicacion_vs_cantidad,
        name="ubicacion_vs_cantidad",
    ),
    path(
        "shopping/temporada-metodo-pago/",
        views.temporada_metodo_pago,
        name="temporada_metodo_pago",
    ),
    # Data Management
    path("data/", views.data_management, name="data_management"),
    # CSV Upload
    path("csv-upload/", views.csv_upload, name="csv_upload"),
    # Customers CRUD
    path("customers/", views.customers_list, name="customers_list"),
    path("customers/add/", views.customer_add, name="customer_add"),
    path("customers/edit/<int:pk>/", views.customer_edit, name="customer_edit"),
    path("customers/delete/<int:pk>/", views.customer_delete, name="customer_delete"),
    # Transactions CRUD
    path("transactions/", views.transactions_list, name="transactions_list"),
    path("transactions/add/", views.transaction_add, name="transaction_add"),
    path(
        "transactions/edit/<int:pk>/", views.transaction_edit, name="transaction_edit"
    ),
    path(
        "transactions/delete/<int:pk>/",
        views.transaction_delete,
        name="transaction_delete",
    ),
    # Products CRUD
    path("products/", views.products_list, name="products_list"),
    path("products/add/", views.product_add, name="product_add"),
    path("products/edit/<int:pk>/", views.product_edit, name="product_edit"),
    path("products/delete/<int:pk>/", views.product_delete, name="product_delete"),
]
