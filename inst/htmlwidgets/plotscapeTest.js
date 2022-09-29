HTMLWidgets.widget({

  name: 'plotscapeTest',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.classList.add("graphicDiv")
        el.innerText = PLOTSCAPE.mean(x.data);
        const scene = new PLOTSCAPE.Scene(el, new PLOTSCAPE.DataFrame(x.data))

        x.types.forEach((e, i) => {
          const mapping = x.mappings[i]
          const mappingArray = Object.keys(mapping).map(e => [e, mapping[e]])
          scene.addPlotWrapper(e, new PLOTSCAPE.Mapping(...mappingArray))
        })

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
