# UI customization

## CSS Themes

Currently, Inji supports two themes:

* orange
* purple

We can customize the application by adding a new file under `components/ui/themes` and import that file in `components/ui/styleUtils.ts` and assign that to `Theme` variable in it.
Orange theme is referred as DefaultTheme.

```
Example:-
    components/ui/styleUtils.ts

    import { PurpleTheme } from './PurpleTheme';
    export const Theme = PurpleTheme;
```

### Logo and Background Images

To change the MOSIP logo:

```
MosipLogo: require(path of logo you want to use, in string format) in a theme file

Example:-
export const DefaultTheme = {
    MosipLogo: require('../../assets/mosip-logo.png')
    ...
}
```

To change the profile logo which is available as a demo while loading the vc details:

```
cardFaceIcon: require(path of logo you want to use, in string format)

Example:-
export const DefaultTheme = {
    cardFaceIcon: require('../../assets/placeholder-photo.png')
    ...
}
```

To change the `CloseCard` details background:

```
CloseCard: require(path of the image you want to use, in string format)

Example:-
export const DefaultTheme = {
    CloseCard: require('../../assets/card_bg.png')
    ...
}
```

To change the `OpenCard` card details background:

```
OpenCard: require(path of the image you want to use, in string format)

Example:-
export const DefaultTheme = {
    OpenCard: require('../../assets/card_bg.png')
    ...
}
```

To change the top header icons:

<img src="_images/header_icons.png" height=400 width=200>

In `HomeScreenLayout.tsx`, refer

```
const HomeScreenOptions = {
    headerLeft: ()  // for Inji icon
    headerRight: () // for help and setting icon
}
```

### Colours

To change the text, colour and logo for Tabs:

<img src="_images/bottom_tabs.png" height=400 width=200>

In `main.ts`, there are 3 tab screens variables

```
const home: TabScreen
const scan: TabScreen
const history: TabScreen

```

`text` can be changed by `name` attribute
`logo` can be changed by `icon` attribute
`colour` can be changed by `color` attribute in `MainLayout.tsx` while rendering `Navigator`

```
Example:-
color={focused ? Theme.Colors.Icon : Theme.Colors.GrayIcon}
```

To change the colour of the Details Label Text:

<img src="_images/details-label.png" height=400 width=200>

```
export const DefaultTheme = {
  Colors: {
      DetailsLabel: Colors.Gray40,
    ...
  }
}
```

To change the colour of Details Value Text:

<img src="_images/details-value.png" height=400 width=200>

```
export const DefaultTheme = {
  Styles: StyleSheet.create({
      detailsValue: {
        color: Colors.Black,
        fontSize: 12,
    }
    ...
  })
}
```

To change the colour of `+` icon colour:

<img src="_images/add-id-button.png" height=400 width=200>

In `HomeScreen.tsx`, refer `DownloadFABIcon` component
```
const DownloadFABIcon: React.FC = () => {
    const plusIcon
....
}
```

To change the colour of the Loading Transition:

<img src="_images/loading-transition.png" height=400 width=200>

```
export const DefaultTheme = {
  Colors: {
       Loading: colors.Orange,
    ...
  }
}
```

To change the colour of the Error message:

<img src="_images/error-message.png" height=400 width=200>

```
export const DefaultTheme = {
  Styles: StyleSheet.create({
      error: {
        color: Colors.Red,
        fontFamily: 'Inter_600SemiBold',
        fontSize: 12,
    }
    ...
  })
}
```

To change the colour of noUinText:

<img src="_images/no-uin-text.png" height=400 width=200>

```
export const DefaultTheme = {
  Colors: {
       getVidColor: Colors.Zambezi,
    ...
  }
}
```

To change the colours of Label in Settings:

<img src="_images/settings-labels.png" height=400 width=200>

```
export const DefaultTheme = {
  Colors: {
     settingsLabel: Colors.Black,
     textLabel: Colors.Grey,
    ...
  }
}
```

To change the background and label colour for version section:

<img src="_images/about-version.png" height=400 width=200>

```
export const DefaultTheme = {
    Colors: {
      aboutVersion: Colors.Gray40,
      ...
    },
    Styles: StyleSheet.create({
      versionContainer: {
        backgroundColor: Colors.Grey6,
        margin: 4,
        borderRadius: 14,
    }
    ...
  })
}
```

To change colour on add new card page:

<img src="_images/add-new-card.png" height=400 width=200>

```
export const DefaultTheme = {
    Styles: StyleSheet.create({
      ssuerHeading: {
      fontFamily: 'Inter_600SemiBold',
      fontSize: 14,
      lineHeight: 17,
      paddingHorizontal: 3,
      paddingBottom: 4,
      paddingTop: 1.7,
    },
    issuerDescription: {
      fontSize: 11,
      lineHeight: 14,
      color: Colors.ShadeOfGrey,
      paddingVertical: 5,
      paddingHorizontal: 3,
      paddingTop: 1.4,
    }
    ...
  })
}
```

## Sunbird VC Card Customization : 

The VC from Sunbird is dynamically rendered with all the fields , and If the display properties provided in the [wellknown](https://esignet.collab.mosip.net/.well-known/openid-credential-issuer), the INJI downloads the wellknown and applies the below properties on the VC template to modify the VC render.
* Text Colour
* Background Colur
* Logo Change

```
{
  "display": [
    {
      "name": "Sunbird RC Insurance Verifiable Credential",
      "locale": "en",
      "logo": {
        "url": "https://sunbird.org/images/sunbird-logo-new.png",
        "alt_text": "a square logo of a Sunbird"
      },
      "background_color": "#FDFAF9",
      "text_color": "#7C4616"
    }
  ]
}
```

[//]: # (<Corresponding Images has to attached here>)
