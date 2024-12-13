import 'amazon_pay.dart';
import 'card.dart';
import 'klarna.dart';
import 'link.dart';

class PaymentMethodOptions {
  AmazonPay? amazonPay;
  Card? card;
  Klarna? klarna;
  Link? link;

  PaymentMethodOptions({
    this.amazonPay,
    this.card,
    this.klarna,
    this.link,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      amazonPay: json['amazon_pay'] == null
          ? null
          : AmazonPay.fromJson(json['amazon_pay'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      klarna: json['klarna'] == null
          ? null
          : Klarna.fromJson(json['klarna'] as Map<String, dynamic>),
      link: json['link'] == null
          ? null
          : Link.fromJson(json['link'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'amazon_pay': amazonPay?.toJson(),
        'card': card?.toJson(),
        'klarna': klarna?.toJson(),
        'link': link?.toJson(),
      };
}