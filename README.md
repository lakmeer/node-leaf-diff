
# LeafDiff

Compile a flat list of all the points where the leaf values of two instances of a particular
tree structure were different. Outputs a list labelled by a dotted.accessor.name, like this:

    # Some data

    old-data = { time : 1000, data : { x : 200, y : 200, button1 : on,  button2 : off } }
    new-data = { time : 1001, data : { x : 202, y : 198, button1 : off, button2 : off } }

    console.log leaf-diff old-data, new-data

    => [ { key: "time",         old: 1000, new: 1001  },
         { key: 'data.x',       old: 200,  new: 202   },
         { key: 'data.y',       old: 200,  new: 198   },
         { key: 'data.button1', old: true, new: false } ]

if that's something you're interested in.

