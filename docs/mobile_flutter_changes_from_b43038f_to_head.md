# Mobile Flutter -> SDK Migration Notes

Generated: 2026-05-20 (Asia/Ho_Chi_Minh)
Source repo: `/Users/nguyendong/ANPHATTECH/Pottel/mobile-app-flutter`
Target repo: `/Users/nguyendong/ANPHATTECH/Pottel/new_sdk_pottel`

## Scope

Commit range used:
- Start (excluded): `b43038f2e7c2c002537bfce20ec0a5752895dd8e`
- End (included): `fbc4463570533b9128cb3dc9f440690d05158312` (`HEAD` at extraction time)

Range stats:
- 4 commits
- 30 changed files
- 2425 insertions, 302 deletions
- Main functional impact: `lib/screens/payment_skyfi/*`

## Commit Timeline

1. `e956351870742e04df1ab73f1b1d15c13cf8266d` (2026-04-07 09:14:19 +0700)
- feat: Enhance address selection and shipping fee calculation
- Adds 2-level/3-level address mode, autosuggest API integration, shipping fee recalculation logic.

2. `85cb37b22c48ee2900e6a12ad0267c16229ea8f6` (2026-04-07 09:27:16 +0700)
- feat: Update URLs to use pottel.dev for terms and conditions and related documents
- Repoints policy/terms URLs to `https://pottel.dev/...`.

3. `21506802a251bc663bff8c7cd98bc03778db4143` (2026-04-07 15:51:02 +0700)
- feat: Update project configuration for Pottel, including Firebase settings and deep link handling
- Firebase/App config changes (mobile runtime config scope).

4. `fbc4463570533b9128cb3dc9f440690d05158312` (2026-04-07 15:54:39 +0700)
- feat: Enhance Fastfile with new functions for commit logging and message formatting
- Fastlane automation updates (CI/release scope).

## What Should Be Ported To SDK (Priority)

### P0 - Payment Address Core (should port first)

Source files:
- `lib/screens/payment_skyfi/services/address_service.dart`
- `lib/screens/payment_skyfi/provider/address_provider.dart`
- `lib/screens/payment_skyfi/provider/payment_order_provider.dart`
- `lib/screens/payment_skyfi/models/address_response_model.dart`
- `lib/screens/payment_skyfi/models/address_suggestion_model.dart`
- `lib/screens/payment_skyfi/widgets/address_form.dart` (extract logic, not UI)

Behavior/spec to keep:
1. Address mode switching:
- `AddressMode.twoLevel` and `AddressMode.threeLevel`
- Two-level flow: Province -> Ward
- Three-level flow: Province -> District -> Ward

2. New endpoints used:
- `GET /bss/app/get-new-cities`
- `GET /bss/app/get-new-wards`
- `GET /bss/app/map/autosuggest?text=...`
- `GET /bss/app/map/place/detail/{id}`
- `POST /bss/app/get-shipping-fee`

3. Existing endpoints still used:
- `GET /bss/app/get-cities`
- `GET /bss/app/get-districts`
- `GET /bss/app/get-wards`

4. Data mapping rules:
- `vnpost_province_code` -> `NewCityModel.vnpostProvinceCode`
- `vnpost_commune_code` -> `NewWardModel.vnpostCommuneCode`
- `city_id` -> `NewWardModel.cityId`
- robust int parsing from dynamic values

5. Shipping fee consistency rule (critical):
- Never stack shipping repeatedly into total.
- Formula from app:
  - `nextTotal = currentTotal - previousShipping + newShipping`
  - clamp to `>= 0`

6. Autosuggest flow rules:
- Debounce suggestion query (450ms in app)
- Empty keyword -> empty list
- If selected place has post codes, map it back to internal city/ward by VNPost codes

### P1 - Checkout/validation integration points

Source files:
- `lib/screens/payment_skyfi/widgets/bottom_action_bar.dart`
- `lib/screens/payment_skyfi/payment_skyfi_screen.dart`
- `lib/screens/payment_skyfi/widgets/select_address_data.dart`

Behavior/spec to keep:
- Validation differs by mode (`USIM`, `ESIM`, `ALL`)
- For two-level address mode, remove `district_id` before create order payload
- Keep checkout payload assembly order stable (`items`, coupon handling, payment method)

### P2 - Terms/Policy URL migration

Source files:
- `lib/screens/account_info_skyfi/account_term_policy.dart`
- `lib/screens/dktt_skyfi/preview_contact_screen.dart`
- `lib/screens/manager_sim/sim_not_active_detail.dart`

Behavior/spec to keep:
- Policy URLs use domain `https://pottel.dev/{languageCode}/...`.
- This is low-risk for SDK core unless SDK exposes these links.

## What Should NOT Be Ported To SDK Core

Skip in SDK core package:
- `android/fastlane/*`, `ios/fastlane/*`
- Firebase platform config files (`google-services.json`, `GoogleService-Info.plist`, `firebase_options.dart`)
- App-only UI composition in `address_form.dart` / `select_address_data.dart` (keep only business logic)

## SDK Implementation Mapping (Suggested)

Map from mobile app to SDK structure:

1. `lib/src/features/payment/address/address_service.dart`
- Port from mobile `services/address_service.dart`
- Keep pure API + parsing logic.

2. `lib/src/features/payment/address/models/*.dart`
- Port `NewCityModel`, `NewWardModel`, `AddressSuggestionModel`
- Keep json contracts compatible.

3. `lib/src/features/payment/address/address_state.dart`
- Recreate `AddressMode`, selected nodes, current step.
- Do not bind to UI widgets.

4. `lib/src/features/payment/order/payment_order_state.dart`
- Port `updateShippingAmount()` behavior exactly.

5. `lib/src/features/payment/checkout/checkout_payload_builder.dart`
- Encapsulate payload branching (two-level removes `district_id`).

6. `example/` app
- Add integration sample for:
  - switch 2-level/3-level address mode
  - fetch autosuggest
  - recalc shipping fee without stacking

## Quick Execution Plan for SDK Team

1. Implement `address_service` + models first (P0).
2. Implement `payment_order_state.updateShippingAmount()` and add unit tests.
3. Implement address-mode-aware payload builder.
4. Wire into current SDK checkout flow.
5. Add example usage and smoke test with real API.

## Verification Checklist

- [ ] Two-level flow returns city/ward and computes shipping fee.
- [ ] Three-level flow returns city/district/ward and computes shipping fee.
- [ ] Switching mode resets invalid previous selections.
- [ ] Re-fetch shipping fee updates total without double-counting old shipping.
- [ ] Autosuggest select can map back to internal city/ward using VNPost codes.
- [ ] Checkout payload drops `district_id` only in two-level mode.

## Command References (for re-extraction)

```bash
cd /Users/nguyendong/ANPHATTECH/Pottel/mobile-app-flutter

git log --reverse --date=iso --pretty=format:'%H|%ad|%s' \
  b43038f2e7c2c002537bfce20ec0a5752895dd8e..HEAD

git diff --stat b43038f2e7c2c002537bfce20ec0a5752895dd8e..HEAD

git diff --name-status b43038f2e7c2c002537bfce20ec0a5752895dd8e..HEAD
```
