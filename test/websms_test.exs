defmodule WebsmsTest do
  @moduledoc false

  use ExUnit.Case

  doctest Websms

  @auth_token Application.get_env(:websms, :auth_token, System.fetch_env!("WEBSMS_AUTH_TOKEN"))

  describe "POST /smsmessaging/text" do
    test "authorized" do
      assert {:ok,
              {200, %{smsCount: 0, statusCode: 2000, statusMessage: "OK", transferId: _}, _client}} =
               Websms.post_smsmessaging_text(%{
                 body: %{
                   messageContent: "Test",
                   test: true,
                   recipientAddressList: ["+41787245790"]
                 },
                 headers: %{"authorization" => "Bearer #{@auth_token}"}
               })
    end

    test "unauthorized" do
      assert {:ok, {401, nil, _client}} =
               Websms.post_smsmessaging_text(%{
                 body: %{
                   messageContent: "Test",
                   test: true,
                   recipientAddressList: ["+41787245790"]
                 }
               })
    end
  end

  describe "GET /smsmessaging/simple" do
    # 406?
    # test "authorized" do
    #   assert {:ok, {200, %{smsCount: 0, statusCode: 2000, statusMessage: "OK", transferId: _}, _client}} =
    #            Websms.get_smsmessaging_simple(%{
    #              query: %{
    #                messageContent: "Test",
    #                test: true,
    #                recipientAddressList: ["+41787245790"]
    #              },
    #              headers: %{"authorization" => "Bearer #{@auth_token}"}
    #            })
    # end

    test "unauthorized" do
      assert {:ok, {401, nil, _client}} =
               Websms.get_smsmessaging_simple(%{
                 query: %{
                   messageContent: "Test",
                   test: true,
                   recipientAddressList: ["+41787245790"]
                 }
               })
    end
  end

  describe "POST /smsmessaging/binary" do
    test "authorized" do
      assert {:ok,
              {200, %{smsCount: 0, statusCode: 2000, statusMessage: "OK", transferId: _}, _client}} =
               Websms.post_smsmessaging_binary(%{
                 body: %{
                   messageContent: [Base.encode64("Test")],
                   test: true,
                   recipientAddressList: ["+41787245790"]
                 },
                 headers: %{"authorization" => "Bearer #{@auth_token}"}
               })
    end

    test "unauthorized" do
      assert {:ok, {401, nil, _client}} =
               Websms.post_smsmessaging_binary(%{
                 body: %{
                   messageContent: [Base.encode64("Test")],
                   test: true,
                   recipientAddressList: ["+41787245790"]
                 }
               })
    end
  end

  describe "POST /smsmessaging/simple" do
    # No support for Form Data yet
    # test "authorized" do
    #   assert {:ok,
    #           {200, %{smsCount: 0, statusCode: 2000, statusMessage: "OK", transferId: _}, _client}} =
    #            Websms.post_smsmessaging_simple(%{
    #              body: %{
    #                messageContent: "Test",
    #                test: true,
    #                recipientAddressList: ["+41787245790"]
    #              },
    #              headers: %{"authorization" => "Bearer #{@auth_token}"}
    #            })
    # end

    test "unauthorized" do
      assert {:ok, {401, nil, _client}} =
               Websms.post_smsmessaging_simple(%{
                 body: %{
                   messageContent: "Test",
                   test: true,
                   recipientAddressList: ["+41787245790"]
                 }
               })
    end
  end
end
