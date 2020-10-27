# Websms

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/jshmrtn/websms/master/LICENSE)
![.github/workflows/elixir.yml](https://github.com/jshmrtn/websms/workflows/.github/workflows/elixir.yml/badge.svg)
[![Hex.pm Version](https://img.shields.io/hexpm/v/websms.svg?style=flat)](https://hex.pm/packages/websms)
[![Coverage Status](https://coveralls.io/repos/github/jshmrtn/websms/badge.svg?branch=master)](https://coveralls.io/github/jshmrtn/websms?branch=master)

websms.ch client

## Installation

The package can be installed by adding `websms` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:websms, "~> 0.1.0"}
  ]
end
```

## Usage

### Send Text Message

```elixir
{:ok,
  {200, %{smsCount: 0, statusCode: 2000, statusMessage: "OK", transferId: _}, _client}} =
    Websms.post_smsmessaging_text(%{
      body: %{
        messageContent: "Test",
        test: true,
        recipientAddressList: ["+41787245790"]
      },
      headers: %{"authorization" => "Bearer #{@auth_token}"}
    })
```

### Send Binary Message

```elixir
{:ok,
  {200, %{smsCount: 0, statusCode: 2000, statusMessage: "OK", transferId: _}, _client}} =
    Websms.post_smsmessaging_binary(%{
      body: %{
        messageContent: [Base.encode64("Test")],
        test: true,
        recipientAddressList: ["+41787245790"]
      },
      headers: %{"authorization" => "Bearer #{@auth_token}"}
    })
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). The docs can be found at
[https://hexdocs.pm/websms](https://hexdocs.pm/websms).

