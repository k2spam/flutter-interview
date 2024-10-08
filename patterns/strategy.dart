abstract class PaymentStrategy {
  void pay(double amount);
}

class CreditCardPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print("Paid $amount using credit card");
  }
}

class PaypalPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('Paid $amount using paypal');
  }
}

class PaymentContext {
  PaymentStrategy? _strategy;

  void setStrategy(PaymentStrategy strategy) {
    _strategy = strategy;
  }

  void process(double amount) {
    _strategy?.pay(amount);
  }
}

void main() {
  PaymentContext payment = PaymentContext();

  payment.setStrategy(CreditCardPayment());
  payment.process(100);

  payment.setStrategy(PaypalPayment());
  payment.process(122);
}