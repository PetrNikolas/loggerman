defmodule Loggerman.LogsController do
  use Loggerman.Web, :controller
  
  def index(conn, %{"text" => text} = params) do
    # webhookURL = "https://hooks.slack.com/services/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"

    #headers = [
    #    {"Content-Type", "application/json; charset=utf-8"},
    #    {"Accept", "application/json"},
    #    {"Access-Control-Allow-Origin", "*"}
    #]

    body = %{ 
        text: text,
        channel: "#YOUR-CHANNEL"
    } 

    with {:ok, body} do
        conn
        |> send_log_to_slack(body)
        # {:ok, body} = Poison.encode(body)
        # HTTPoison.post(webhookURL, body, headers)
        |> json body
    else
        {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(%{errors: errors})
    end
  end

  # Metho for send log to Slack channel
  def send_log_to_slack(conn, body) do
    webhookURL = "https://hooks.slack.com/services/YOUR-URL-TOKEN"

    headers = [
        {"Content-Type", "application/json; charset=utf-8"},
        {"Accept", "application/json"},
        {"Access-Control-Allow-Origin", "*"}
    ]

    {:ok, body} = Poison.encode(body)

    HTTPoison.post(webhookURL, body, headers)
  end    
end