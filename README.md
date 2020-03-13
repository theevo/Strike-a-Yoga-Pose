# Strike a (yoga) Pose

## Summary

This iPhone app displays a list of 48 yoga poses which includes English names, Sanskrit names, and glyphs.

## How I built this

The app makes a live API call to the [Yoga API](https://github.com/rebeccaestes/yoga_api) and fetches the necessary information needed from all 48 poses.

The image URLs provided by the API are links to SVG files, which at the present time do not render in `UIImageView`. I had to manually convert each SVG into PNG offline and add the PNGs as assets to the app. Each PNG was renamed to match the ID of each pose.

As each pose is rendered, the app will call its glyph by its ID number.


## Credits

### The Yoga API

[https://github.com/rebeccaestes/yoga_api](https://github.com/rebeccaestes/yoga_api)
