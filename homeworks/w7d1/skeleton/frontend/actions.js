const SWITCH_CURRENCY = "SWITCH_CURRENCY";

const selectCurrency = (baseCurrency, rates) => ({
  type: SWITCH_CURRENCY,
  baseCurrency,
  rates
});

export { selectCurrency, SWITCH_CURRENCY };

// window.selectCurrency = selectCurrency;
