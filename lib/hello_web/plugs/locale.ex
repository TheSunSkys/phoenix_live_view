defmodule HelloWeb.Plugs.Locale do
  import Plug.Conn

  @locales ["en", "th"]

  def init(default), do: default

  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
    Gettext.put_locale(HelloWeb.Gettext, loc)
    assign(conn, :locale, loc)
  end

  def call(conn, default) do
    assign(conn, :locale, default)
  end
end
