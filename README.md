# Elm Nested List Example

A simple example of a nested list component in Elm `v0.17`.

This example illustrates child to parent communication. The trick is to return a dispatch message from the child's update function and then do some pattern matching in the parent's update function to respond correctly to the dispatched message.

Credit to [Petre Damoc](https://github.com/pdamoc) for teaching me this in his [example](https://github.com/pdamoc/elm-architecture-tutorial/blob/master/examples/4/Counter.elm).

## Setting up

Install Elm and Node.js.

Run `npm run build` and then open `index.html` in a browser.
