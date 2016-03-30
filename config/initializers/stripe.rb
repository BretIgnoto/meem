Rails.configuration.stripe = {
  :publishable_key => "pk_test_Yb52ldePlfHb8IUJCWbZNQpY",
  :secret_key      => "sk_test_njn4LTteWNzRkZaP92VXNIj6"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]