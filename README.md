# is_device_secure

A Flutter plugin that checks whether the device is **secure** — for example, if it has a secure lock screen setup (PIN, pattern, password, fingerprint, etc.).
It can also provide platform information for debugging or device checks.

This plugin helps developers ensure their app is running on a device that enforces basic security measures, which is especially useful for apps that handle sensitive data such as banking, payment, or enterprise apps.

---

## Features

* ✅ Check if the device is secured with PIN, password, or biometric lock
* 🧩 Works on **Android** and **iOS**
* ⚡ Lightweight and easy to use
* 🔒 Helps enforce security policies before granting access

---

## Installation

Add this line to your app’s `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  is_device_secure: ^<latest_version>
```

Then, run:

```bash
flutter pub get
```

---

## Usage

```dart
final isSecure = await IsDeviceSecure.secure;
print("Is device secure: $isSecure");
```

---

## Output

Example output on a secured device:

```
Is device secure: true
```

Example output on an unsecured device (no lock screen):

```
Is device secure: false
```

---

## Platform Support

| Platform | Supported | Notes                                                       |
| -------- | --------- | ----------------------------------------------------------- |
| Android  | ✅         | Uses Android’s `KeyguardManager.isDeviceSecure()`           |
| iOS      | ✅         | Uses iOS’s `LAContext().canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)` |
| Web      | ❌         | Not supported                                               |
| macOS    | ❌         | Not supported                                               |
| Windows  | ❌         | Not supported                                               |
| Linux    | ❌         | Not supported                                               |

---

## Example Use Cases

* Enforcing security before login or payment
* Displaying a warning when the device isn’t secured
* Logging device security info for audits or analytics

---

## Contributing

Contributions are welcome!
Feel free to open issues or submit pull requests to improve the plugin.

---

## License

This project is licensed under the [License](https://github.com/sanathe06/is_device_secure/blob/master/LICENSE).
