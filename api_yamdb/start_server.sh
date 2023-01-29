exec gunicorn --reload api_yamdb.wsgi:application \
    --bind 0.0.0.0:8000
