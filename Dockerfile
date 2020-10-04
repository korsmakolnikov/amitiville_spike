FROM prima/elixir:1.10.3-1

# Serve per avere l'owner dei file scritti dal container uguale all'utente Linux sull'host
USER app

COPY entrypoint /entrypoint

ENTRYPOINT ["./entrypoint"]

