# fart_scroll

You want fart noises as you scroll? I've got you covered.

Everyone farts. And now your apps* can too.

Heavily inspired by [fartscroll.js](http://theonion.github.io/fartscroll.js/)


## How to use

Simply mixin `FartScrollMixin` with your `State` and pass
`fartScrollController` to a widget which takes a `ScrollController`.

```dart
class _HomePageState extends State<HomePage> with FartScrollMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
          controller: fartScrollController,
          itemCount: 500,
          itemBuilder: (_, index) {
            return ListTile(title: Text("Item $index"));
          }),
    );
  }
}
```
