# Cozycation

Cozycation - Apartment finder app.

Using providers for state management

Demo

![](assets/shot/shot.gif)

## Dependencies

- [provider](https://pub.dev/packages/provider)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [http](https://pub.dev/packages/http)

## Usage Provider - State Management

### Exposing a value

#### Exposing a new object instance

Providers allow you to not only expose a value, but also create, listen, and dispose of it.

To expose a newly created object, use the default constructor of a provider.
Do _not_ use the `.value` constructor if you want to **create** an object, or you
may otherwise have undesired side effects.

See [this StackOverflow answer](https://stackoverflow.com/questions/52249578/how-to-deal-with-unwanted-widget-build)
which explains why using the `.value` constructor to create values is undesired.

- **DO** create a new object inside `create`.

```dart
Provider(
  create: (_) => MyModel(),
  child: ...
)
```

- **DON'T** use `Provider.value` to create your object.

```dart
ChangeNotifierProvider.value(
  value: MyModel(),
  child: ...
)
```

- **DON'T** create your object from variables that can change over time.

  In such a situation, your object would never update when the
  value changes.

```dart
int count;

Provider(
  create: (_) => MyModel(count),
  child: ...
)
```

If you want to pass variables that can change over time to your object,
consider using `ProxyProvider`:

```dart
int count;

ProxyProvider0(
  update: (_, __) => MyModel(count),
  child: ...
)
```

**NOTE**:

When using the `create`/`update` callback of a provider, it is worth noting that this callback
is called lazily by default.

This means that until the value is requested at least once, the `create`/`update` callbacks won't be called.

This behavior can be disabled if you want to pre-compute some logic, using the `lazy` parameter:

```dart
MyProvider(
  create: (_) => Something(),
  lazy: false,
)
```

#### Reusing an existing object instance:

If you already have an object instance and want to expose it, it would be best to use the `.value` constructor of a provider.

Failing to do so may call your object `dispose` method when it is still in use.

- **DO** use `ChangeNotifierProvider.value` to provide an existing
  [ChangeNotifier].

```dart
MyChangeNotifier variable;

ChangeNotifierProvider.value(
  value: variable,
  child: ...
)
```

- **DON'T** reuse an existing [ChangeNotifier] using the default constructor

```dart
MyChangeNotifier variable;

ChangeNotifierProvider(
  create: (_) => variable,
  child: ...
)
```