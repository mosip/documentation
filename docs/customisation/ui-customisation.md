# UI Customization

## **CSS Themes**

Currently inji supports two themes:

- orange
- purple

We can customize the application by adding a new file under `components/ui/themes` and import that file in `components/ui/styleUtils.ts` and assign that file to `Theme` variable in it.

```
Example:-
    components/ui/styleUtils.ts

    import { PurpleTheme } from './PurpleTheme';
    export const Theme = PurpleTheme;
```

### **Logo and Background Images :**

To change the mosip logo:

```
MosipLogo = require(path of logo you want to use, in string format)

Example:-
MosipLogo = require('../../assets/mosip-logo.png')
```

To change the profile logo which is available as a demo while loading the vc details:

```
ProfileIcon = require(path of logo you want to use, in string format)

Example:-
ProfileIcon: require('../../assets/placeholder-photo.png')
```

To change the close card details background:

```
CloseCard = require(path of image you want to use, in string format)

-width: 363 pixels
-height: 236 pixels

Example:-
CloseCard: require('../../assets/ID-closed.png')
```

To change the OpenCard card details background:

```
OpenCard = require(path of image you want to use, in string format)

-width: 363 pixels
-height: 623 pixels

Example:-
  OpenCard: require('../../assets/ID-open.png')
```

### **Colors :**

To change the color of TabItemText:

![Image](./../_images/tab-item-text.png)

```
export const DefaultTheme = {
  Colors: {
    TabItemText: colors.Orange,
    ...
  }
}
```

To change the color of Details Label Text:

![Image](./../_images/details-label.png)

```
export const DefaultTheme = {
  Colors: {
      DetailsLabel: colors.Orange,
    ...
  }
}
```

To change the color of Details Value Text:

![Image](./../_images/details-value.png)

```
export const DefaultTheme = {
  Colors: {
      Details: Colors.Black,
    ...
  }
}
```

To change the color of AddId Button Text and Background:

![Image](./../_images/add-id-button.png)

```
export const DefaultTheme = {
  Colors: {
     AddIdBtnBg: colors.Orange,
      AddIdBtnTxt: colors.Orange,
    ...
  }
}
```

To change the color of Icons:

![Image](./../_images/icons.png)

```
export const DefaultTheme = {
  Colors: {
      Icon: colors.Orange,
    ...
  }
}
```

To change the Background Color of Icons:

![Image](./../_images/icon-bg.png)

```
export const DefaultTheme = {
  Colors: {
       IconBg: colors.Orange,
    ...
  }
}
```

To change the Color of Loading Transition:

![Image](./../_images/loading-transition.png)

```
export const DefaultTheme = {
  Colors: {
       Loading: colors.Orange,
    ...
  }
}
```

To change the Color of Error message:

![Image](./../_images/error-message.png)

```
export const DefaultTheme = {
  Colors: {
      errorMessage: Colors.Red,
    ...
  }
}
```

To change the Color of noUinText:

![Image](./../_images/no-uin-text.png)

```
export const DefaultTheme = {
  Colors: {
       noUinText : colors.Orange,
    ...
  }
}
```

To change the Colors of Profile Label and Profile Values:

![Image](./../_images/profile-values.png)

```
export const DefaultTheme = {
  Colors: {
     profileLabel: Colors.Black,
     profileValue: Colors.Grey,
    ...
  }
}
```

To change the Color of profileVersion:

![Image](./../_images/profile-version.png)

```
export const DefaultTheme = {
  Colors: {
      profileVersion: Colors.Grey,
    ...
  }
}
```
