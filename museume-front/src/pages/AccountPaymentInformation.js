import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getBillingPlans, createCheckoutSession, getSubscriptionStatus, cancelSubscription } from '../redux/slices/billingSlice';
import Navigation from './Navigation';
import Loader from '../components/Loader';
import { CURRENCY_SIGN_MAP } from '../constants';
import { useTranslation } from 'react-i18next'; // Import the useTranslation hook

const SubscriptionPage = () => {
  const { t } = useTranslation();
  const dispatch = useDispatch();
  const {
    plans,
    subscriptionStatus,
    isLoading,
    error
  } = useSelector((state) => state.billing);

  useEffect(() => {
    dispatch(getBillingPlans());
    dispatch(getSubscriptionStatus());
  }, [dispatch]);

  const handleUpgrade = async (planId) => {
    try {
      const response = await dispatch(createCheckoutSession(planId)).unwrap();
      if (response?.url) {
        window.location.href = response.url;
      }
    } catch (err) {
      console.error('Checkout error:', err);
    }
  };

  const handleCancel = async () => {
    try {
      await dispatch(cancelSubscription()).unwrap();
      // Refresh subscription status after cancellation
      dispatch(getSubscriptionStatus());
    } catch (err) {
      console.error('Cancel subscription error:', err);
    }
  };

  if (isLoading) return <Loader />;

  const isSubscribed = subscriptionStatus?.active;
  const activePlanId = subscriptionStatus?.plan?.id;

  const getCurrencySign = (currency) => {
    return CURRENCY_SIGN_MAP[currency] || currency;
  };

  return (
    <>
      <Navigation />
      <div className="subscription-container">
        <h1 className="subscription-title">{t("Rate Plans")}</h1>
        <p className="subscription-description">
          {t("Basic functions are available free of charge. Depending on the functionality you need,")}<br />
          {t("You can upgrade at any time.")}
        </p>

        <div className="subscription-box">
          {plans?.map((plan, index) => (
            <div key={plan.id} className={`subscription-half ${index !== plans.length - 1 ? 'with-border' : ''}`}>
              <p className="subscription-type">{plan.name}</p>
              <h2 className="subscription-price">
                {getCurrencySign(plan.currency.toUpperCase())} {plan.amount}<span>/{plan.interval}</span>
              </h2>
              <button
                className={`subscription-button ${isSubscribed && plan.id === activePlanId ? 'cancel' : 'upgrade'}`}
                onClick={() => isSubscribed && plan.id === activePlanId ? handleCancel() : handleUpgrade(plan.id)}
              >
                {isSubscribed && plan.id === activePlanId ? ('Cancel Subscription') : t('Upgrade')}
              </button>
              <ul className="feature-list">
                {plan.features.split(', ').map((feature, index) => (
                  <li key={index}>{feature}</li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {error && (
          <div className="error-message">
            {error}
          </div>
        )}

        {/* Comparison Table */}
        <div className="comparison-section">
          <h2 className="comparison-title">{t("Plans and Features")}</h2>
          <table className="comparison-table">
            <thead>
              <tr>
                <th>{t("Free Plan")}</th>
                <th>{t("Paid Plans")}</th>
              </tr>
            </thead>
            <tbody>
              <tr className="price-row">
                <td>¥0</td>
                <td>{getCurrencySign(plans?.[0]?.currency.toUpperCase())} {plans?.[0]?.amount}</td>
              </tr>
              <tr>
                <td>—</td>
                <td><span className="circle"></span></td>
              </tr>
              <tr>
                <td>—</td>
                <td><span className="circle"></span></td>
              </tr>
              <tr>
                <td>—</td>
                <td><span className="circle"></span></td>
              </tr>
              <tr>
                <td>Up to 3 people</td>
                <td>limitless</td>
              </tr>
              <tr>
                <td>—</td>
                <td><span className="circle"></span></td>
              </tr>
              <tr>
                <td>Up to 1000 entries</td>
                <td>limitless</td>
              </tr>
              <tr>
                <td>—</td>
                <td><span className="circle"></span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </>
  );
};

export default SubscriptionPage;
