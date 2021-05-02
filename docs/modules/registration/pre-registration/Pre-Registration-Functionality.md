<!doctype html>
<html>

<head>
   <title data-react-helmet="true">Modules - MOSIP Docs</title>
   <meta data-react-helmet="true" name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   <meta data-react-helmet="true" charset="utf-8" />
   <meta data-react-helmet="true" name="google" value="notranslate" />
   <meta data-react-helmet="true" property="og:image"
      content="https://app.gitbook.com/share/space/thumbnail/-M1R77ZUwR6XwtPjJIVm.png" />
   <meta data-react-helmet="true" property="twitter:card" content="summary" />
   <meta data-react-helmet="true" property="twitter:site" content="MOSIP Docs" />
   <meta data-react-helmet="true" name="description" content="" />
   <meta data-react-helmet="true" property="og:title" content="Modules" />
   <meta data-react-helmet="true" property="og:description" content="" />
   <link data-react-helmet="true" rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Code+Pro:500&amp;display=swap" />
   <link data-react-helmet="true" rel="stylesheet"
      href="https://unpkg.com/emojione-assets@4.0.0/sprites/emojione-sprite-40.min.css" />
   <link data-react-helmet="true" rel="preconnect" href="https://www.googleapis.com" />
   <link data-react-helmet="true" rel="preconnect" href="https://api.amplitude.com" />
   <link data-react-helmet="true" rel="preconnect" href="https://gblobscdn.gitbook.com/" />
   <link data-react-helmet="true" rel="icon"
      href="https://gblobscdn.gitbook.com/orgs%2F-M1FyzBr-VmticWYm8QI%2Favatar-1582980461659.png?alt=media" />
   <link data-react-helmet="true" rel="canonical" href="https://docs.mosip.io/platform/modules" />
   <style data-react-helmet="true" type="text/css">
      @font-face {
         font-family: "Roboto";
         src: local("Roboto"), local("Roboto-Regular"), url(https://gstatic.gitbook.com/fonts/fc3d4b35e4d07d4e0485cc2db0e57c77.woff) format('woff');
         font-weight: 400;
         font-display: swap;
      }

      @font-face {
         font-family: "Roboto";
         src: local("Roboto Medium"), local("Roboto-Medium"), url(https://gstatic.gitbook.com/fonts/f4fa50c4003f87e7dc10459e500933c3.woff) format('woff');
         font-weight: 500;
         font-display: swap;
      }

      @font-face {
         font-family: "Roboto";
         src: local("Roboto Bold"), local("Roboto-Bold"), url(https://gstatic.gitbook.com/fonts/72e37e5bf95a8dba938c78b1d7d91253.woff) format('woff');
         font-weight: 700;
         font-display: swap;
      }
   </style>
   <style data-react-helmet="true" type="text/css">
      @font-face {
         font-family: "Content-font";
         src: local("Roboto"), local("Roboto-Regular"), url(https://gstatic.gitbook.com/fonts/fc3d4b35e4d07d4e0485cc2db0e57c77.woff) format('woff');
         font-weight: 400;
         font-display: swap;
      }

      @font-face {
         font-family: "Content-font";
         src: local("Roboto Medium"), local("Roboto-Medium"), url(https://gstatic.gitbook.com/fonts/f4fa50c4003f87e7dc10459e500933c3.woff) format('woff');
         font-weight: 500;
         font-display: swap;
      }

      @font-face {
         font-family: "Content-font";
         src: local("Roboto Bold"), local("Roboto-Bold"), url(https://gstatic.gitbook.com/fonts/72e37e5bf95a8dba938c78b1d7d91253.woff) format('woff');
         font-weight: 700;
         font-display: swap;
      }
   </style>
   <script data-react-helmet="true" type="text/javascript" defer="true"
      src="https://polyfill.io/v3/polyfill.min.js?flags=gated&amp;features=Intl"></script>
   <style>
      #__GITBOOK__ROOT__SERVER__ {
         width: 100%;
         height: 100%;
         display: flex;
      }
   </style>
   <style>
      #__GITBOOK__ROOT__CLIENT__ {
         width: 100%;
         min-height: 100%;
         height: initial;
         display: flex;
      }
   </style>
   <style id="__GITBOOK__STYLE__">
      html,
      body {
         color: #242A31;
         width: 100%;
         height: 100%;
         margin: 0;
         padding: 0;
         font-size: 15px;
         background: #F5F7F9;
         box-sizing: border-box;
         font-family: "Roboto", sans-serif;
         line-height: 1em;
         font-smoothing: antialiased;
         text-size-adjust: 100%;
         -ms-text-size-adjust: 100%;
         -webkit-font-smoothing: antialiased;
         -moz-osx-font-smoothing: grayscale;
         -webkit-text-size-adjust: 100%;
      }

      @media screen and (min-width: 768px) {

         html,
         body {
            text-rendering: optimizeLegibility;
         }
      }

      @media print {

         html,
         body {
            background: transparent;
         }
      }

      *,
      *:before,
      *:after {
         outline: none;
         box-sizing: inherit;
      }

      @font-face {
         font-family: "Flow-Rounded";
         src: url("https://gstatic.gitbook.com/fonts/bfc0a96537ceb0cad9e956b9f980fe88.woff") format('woff');
         font-display: block;
      }

      input,
      select,
      textarea {
         font-size: 16px;
      }

      input,
      select,
      textarea,
      button {
         font: inherit;
      }

      input[type="search"] {
         -webkit-appearance: none;
      }

      .draggingElement,
      .draggingElement *:hover {
         cursor: grabbing !important;
         pointer-events: auto !important;
      }

      .draggingElement .draggingHidden {
         display: none;
      }

      .reset-3c756112--body-68cac36c {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #242A31;
         width: 100%;
         margin: 0;
         display: flex;
         padding: 0;
         background: #F5F7F9;
         min-height: 100vh;
         flex-direction: column;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--header-07037613--header-09ef972a {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         height: 80px;
         margin: 0;
         display: none;
         padding: 0;
         z-index: 20;
         position: relative;
         box-shadow: 0 3px 8px 0 rgba(116, 129, 141, 0.1);
         border-bottom: 1px solid #d4dadf;
         background-color: #FFFFFF;
      }

      @media print {
         .reset-3c756112--header-07037613--header-09ef972a {
            display: none;
         }
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--header-07037613--header-09ef972a {
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            top: 0;
            width: 100%;
            display: flex;
            position: fixed;
            padding-left: 16px;
            padding-right: 16px;
         }
      }

      @media screen and (max-width: 767px) {
         .reset-3c756112--header-07037613--header-09ef972a {
            height: 60px;
            padding-left: 8px;
            padding-right: 8px;
         }
      }

      .reset-3c756112--headerContainer-bb8cc0bc {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         width: 100%;
         margin: 0 auto;
         display: flex;
         padding: 0;
         max-width: 1448px;
      }

      .reset-3c756112--headerLeftColumn-4eae0bae--headerLeftColumn-7efc9f26 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         width: 100%;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         align-items: center;
         justify-content: space-between;
         -webkit-box-pack: justify;
         -webkit-box-align: center;
      }

      @media screen and (min-width: 1024px) {
         .reset-3c756112--headerLeftColumn-4eae0bae--headerLeftColumn-7efc9f26 {
            max-width: 298px;
            justify-content: center;
            -webkit-box-pack: center;
         }

         .reset-3c756112--headerLeftColumn-4eae0bae--headerLeftColumn-7efc9f26:after {
            top: 50%;
            right: 0;
            height: 40px;
            content: " ";
            position: absolute;
            transform: translateY(-50%);
            border-left: 1px solid #E6ECF1;
         }
      }

      .reset-3c756112--mobileButton-7a76d05f {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 0 0 auto;
         width: 30px;
         cursor: pointer;
         height: 30px;
         margin: 0;
         display: flex;
         outline: none;
         padding: 0;
         font-size: 18px;
         align-items: center;
         justify-content: center;
         -webkit-box-pack: center;
         -webkit-box-align: center;
      }

      @media screen and (min-width: 1024px) {
         .reset-3c756112--mobileButton-7a76d05f {
            display: none;
         }
      }

      .icon-7f6730be--text-3f89f380--icon-1f8349b3 {
         color: #242A31;
         width: 1em;
         height: 1em;
         vertical-align: middle;
      }

      .reset-3c756112--headerLogo-5c0b38e2 {
         margin: 0;
         display: block;
         padding: 0px 24px;
      }

      @media screen and (min-width: 1024px) {
         .reset-3c756112--headerLogo-5c0b38e2 {
            width: 250px;
            padding: 0;
         }
      }

      .reset-3c756112--mobileLogo-dacfd15c {
         margin: 0;
         display: none;
         padding: 0;
      }

      @media screen and (max-width: 767px) {
         .reset-3c756112--mobileLogo-dacfd15c {
            display: block;
         }
      }

      .link-a079aa82--primary-53a25e66--logoLink-10d08504 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #3884FF;
         cursor: pointer;
         display: flex;
         align-items: center;
         text-decoration: none;
         -webkit-box-align: center;
      }

      .reset-3c756112--tooltipContainer-7fdb9b70--small-2ec8ae1a {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         width: 30px;
         height: 30px;
         margin: 0;
         display: flex;
         padding: 0;
         border-radius: 3px;
      }

      .reset-3c756112--avatarFrame-2f40cdc9--small-2ec8ae1a {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         -webkit-mask-image: -webkit-radial-gradient(white, black);
         -webkit-mask-image: -moz-radial-gradient(white, black);
         mask-image: -webkit-radial-gradient(white, black);
         mask-image: -moz-radial-gradient(white, black);
         width: 30px;
         height: 30px;
         margin: 0;
         display: flex;
         padding: 0;
         overflow: hidden;
         position: relative;
         mask-image: radial-gradient(white, black);
         align-items: center;
         border-radius: 3px;
         justify-content: center;
         -webkit-box-pack: center;
         -webkit-box-align: center;
         -webkit-mask-image: radial-gradient(white, black);
      }

      .image-67b14f24--avatar-1c1d03ec {
         width: 100%;
         height: 100%;
         max-width: 100%;
         background-size: cover;
         background-color: #FFFFFF;
         background-repeat: no-repeat;
      }

      .reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-2f40da90 {
         flex: 1;
         color: #242A31;
         margin: 0;
         display: block;
         padding: 0;
         padding-left: 8px;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-2f40da90 {
            overflow: hidden;
            max-width: 50vw;
            white-space: nowrap;
            text-overflow: ellipsis;
         }
      }

      .reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-2f40da90:hover {
         color: #3884FF;
      }

      .text-4505230f--DisplayH700-a03ad9b4--textContentFamily-49a318e1--spaceNameText-677c2969 {
         font-size: 24px;
         font-family: Content-font, Roboto, sans-serif;
         font-weight: 500;
         line-height: 1.5;
         overflow-wrap: break-word;
      }

      .reset-3c756112--desktopLogo-a594db90 {
         margin: 0;
         display: block;
         padding: 0;
      }

      @media screen and (max-width: 767px) {
         .reset-3c756112--desktopLogo-a594db90 {
            display: none;
         }
      }

      .reset-3c756112--tooltipContainer-7fdb9b70--medium-296350e4 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         width: 40px;
         height: 40px;
         margin: 0;
         display: flex;
         padding: 0;
         border-radius: 3px;
      }

      .reset-3c756112--avatarFrame-2f40cdc9--medium-296350e4 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         -webkit-mask-image: -webkit-radial-gradient(white, black);
         -webkit-mask-image: -moz-radial-gradient(white, black);
         mask-image: -webkit-radial-gradient(white, black);
         mask-image: -moz-radial-gradient(white, black);
         width: 40px;
         height: 40px;
         margin: 0;
         display: flex;
         padding: 0;
         overflow: hidden;
         position: relative;
         mask-image: radial-gradient(white, black);
         align-items: center;
         border-radius: 3px;
         justify-content: center;
         -webkit-box-pack: center;
         -webkit-box-align: center;
         -webkit-mask-image: radial-gradient(white, black);
      }

      .reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea {
         flex: 1 1 auto;
         margin: 0px 88px;
         display: block;
         padding: 0;
         overflow: hidden;
         position: relative;
         max-width: 750px;
      }

      .reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea:after {
         background: -webkit-linear-gradient(to right, rgba(255, 255, 255, 0) 0%, #FFFFFF 100%);
         background: -moz-linear-gradient(to right, rgba(255, 255, 255, 0) 0%, #FFFFFF 100%);
         top: 0;
         right: 0;
         width: 32px;
         height: 100%;
         content: " ";
         position: absolute;
         background: linear-gradient(to right, rgba(255, 255, 255, 0) 0%, #FFFFFF 100%);
         pointer-events: none;
      }

      @media screen and (max-width: 1439px) {
         .reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea {
            margin: 0px 24px 0px 88px;
         }
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea {
            display: none;
         }
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48 {
         display: -webkit-box;
         overflow-x: auto;
         height: 100%;
         margin: 0;
         display: flex;
         opacity: 1;
         padding: 0;
         overflow-x: overlay;
         overflow-y: hidden;
         transition: flex 250ms ease, width 250ms ease, opacity 250ms ease;
         -moz-transition: flex 250ms ease, width 250ms ease, opacity 250ms ease;
         -webkit-transition: flex 250ms ease, width 250ms ease, opacity 250ms ease;
         -webkit-overflow-scrolling: touch;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar {
         width: 4px;
         height: 4px;
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-track {
         background: none;
         border-width: 0;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
         transition: background 250ms ease;
         border-radius: 2px;
         -moz-transition: background 250ms ease;
         -webkit-transition: background 250ms ease;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-button {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-track-piece {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-corner {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-resizer {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48:hover::-webkit-scrollbar {
         display: initial;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48:hover::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
      }

      .reset-3c756112--searchInputWrapper-ea7f3052--searchInputWrapper-0442d130 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         height: 80px;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         max-width: 224px;
         align-items: center;
         -webkit-box-align: center;
      }

      .reset-3c756112--searchInputWrapper-ea7f3052--searchInputWrapper-0442d130:before {
         top: 50%;
         left: 0;
         height: 40px;
         content: " ";
         position: absolute;
         transform: translateY(-50%);
         border-left: 1px solid #E6ECF1;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--searchInputWrapper-ea7f3052--searchInputWrapper-0442d130 {
            display: none;
         }
      }

      .reset-3c756112--inputContainer-b2cb171c {
         margin: 0;
         display: block;
         padding: 0;
         padding-left: 14px;
         padding-right: 16px;
      }

      .inputInner-5c86b87d--medium-0bbed4bd--inputInner-4216b016--searchInputPlaceholder-936306be {
         font: inherit;
         color: #242A31;
         width: 100%;
         border: none;
         cursor: inherit;
         height: 38px;
         margin: 0;
         resize: none;
         outline: none;
         padding: 0px 8px;
         background: transparent;
         box-sizing: border-box;
         text-align: left;
         line-height: inherit;
         border-radius: 3px;
      }

      .inputInner-5c86b87d--medium-0bbed4bd--inputInner-4216b016--searchInputPlaceholder-936306be::placeholder {
         color: #9DAAB6;
         font-size: 16px;
         font-weight: 500;
      }

      .reset-3c756112--inputWrapper-63396dac--TextH400-3033861f--medium-4505230f--light-502263b4--input-6d442051--searchInput-3fa812d5 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         width: 100%;
         border: none;
         margin: 0;
         display: flex;
         outline: none;
         padding: 0;
         font-size: 16px;
         background: #FFFFFF;
         box-sizing: border-box;
         font-weight: 400;
         line-height: 1.625;
         border-radius: 3px;
         background-color: #FFFFFF;
      }

      .reset-3c756112--inputInnerSizer-756c9114 {
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
      }

      .reset-3c756112--inputAddOn-45de9ec1--inputAddOnPrefix-202fa60d--icon-1f8349b3 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 0 0 auto;
         color: #242A31;
         order: -1;
         margin: 0;
         display: flex;
         padding: 0;
         align-items: center;
         line-height: 1.2;
         white-space: nowrap;
         padding-left: 8px;
         -webkit-box-align: center;
      }

      .icon-7f6730be--text-3f89f380 {
         width: 1em;
         height: 1em;
         vertical-align: middle;
      }

      .reset-3c756112--bodyContent-2f98451b {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 1;
         color: #3B454E;
         width: 100%;
         margin: 0 auto;
         display: flex;
         padding: 0;
      }

      .reset-3c756112--wholeContent-9fc567d4 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         width: 100%;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         min-height: 100%;
         flex-direction: column;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--wholeContentBody-554be184 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 1;
         margin: 0;
         display: flex;
         padding: 0;
         transition: margin-bottom 250ms ease;
         align-items: stretch;
         -moz-transition: margin-bottom 250ms ease;
         -webkit-box-align: stretch;
         -webkit-transition: margin-bottom 250ms ease;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--wholeContentBody-554be184 {
            padding-top: 80px;
         }
      }

      @media screen and (max-width: 767px) {
         .reset-3c756112--wholeContentBody-554be184 {
            padding-top: 60px;
         }
      }

      @keyframes keyframes-animation-2f81d449-0-1-3301 {
         0% {
            background-color: rgba(24, 48, 85, 0);
         }

         100% {
            background-color: rgba(24, 48, 85, 0.30000000000000004);
         }
      }

      .reset-3c756112--backdrop-1322b68a--hidden-247382c3--overlay-29559ab8 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         top: 0;
         left: 0;
         right: 0;
         bottom: 0;
         margin: 0;
         display: flex;
         padding: 0;
         z-index: 29;
         position: absolute;
         transition: background-color 250ms ease-out;
         align-items: center;
         animation-name: none;
         pointer-events: none;
         -moz-transition: background-color 250ms ease-out;
         justify-content: center;
         -webkit-box-pack: center;
         background-color: rgba(24, 48, 85, 0);
         -webkit-box-align: center;
         -webkit-transition: background-color 250ms ease-out;
         animation-duration: 0.2s;
         animation-fill-mode: forwards;
         animation-timing-function: ease-out;
      }

      @media screen and (min-width: 1024px) {
         .reset-3c756112--backdrop-1322b68a--hidden-247382c3--overlay-29559ab8 {
            z-index: 14;
         }
      }

      .reset-3c756112--contentNavigation-dd3370a4 {
         margin: 0;
         display: block;
         padding: 0;
         z-index: 30;
      }

      @media print {
         .reset-3c756112--contentNavigation-dd3370a4 {
            display: none;
         }
      }

      @media screen and (min-width: 1024px) {
         .reset-3c756112--contentNavigation-dd3370a4 {
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            flex: 0 0 auto;
            width: calc((100% - 1448px) / 2 + 298px);
            display: flex;
            z-index: 15;
            min-width: 298px;
            background: #F5F7F9;
            align-items: stretch;
            border-right: 1px solid #E6ECF1;
            padding-left: calc((100% - 1448px) / 2);
            flex-direction: column;
            -webkit-box-align: stretch;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
         }
      }

      .reset-3c756112--contentNavigationInner-205d49ea--contentNavigationInnerCollapsed-7b4aca00 {
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--contentNavigationInner-205d49ea--contentNavigationInnerCollapsed-7b4aca00 {
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 30;
            position: fixed;
            max-width: 298px;
            transform: translateX(-100%) !important;
            box-shadow: none;
            overflow-y: auto;
            transition: transform 250ms ease;
            border-right: 1px solid #E6ECF1;
            -moz-transition: transform 250ms ease;
            background-color: #fff;
            -webkit-transition: transform 250ms ease;
         }
      }

      .reset-3c756112--sidebarWrapper-84a13d8e {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: auto;
         width: 100%;
         height: 100%;
         margin: 0;
         display: flex;
         padding: 0;
         align-items: stretch;
         flex-direction: column;
         -webkit-box-align: stretch;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112 {
         margin: 0;
         display: block;
         padding: 0;
      }

      .reset-3c756112--sidebar-84a13d8e {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: auto;
         width: 100%;
         height: 100%;
         margin: 0;
         display: flex;
         padding: 0;
         align-items: stretch;
         flex-direction: column;
         -webkit-box-align: stretch;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--navigationHeader-2c71cfec {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 0 0 auto;
         height: 80px;
         margin: 0;
         display: flex;
         padding: 0;
         align-items: center;
         margin-left: 24px;
         border-bottom: 1px solid #E6ECF1;
         padding-right: 12px;
         flex-direction: row;
         -webkit-box-align: center;
         -webkit-box-orient: horizontal;
         -webkit-box-direction: normal;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--navigationHeader-2c71cfec {
            display: none;
         }
      }

      .reset-3c756112--navigationHeaderLogo-756c9114 {
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
      }

      .button-36063075--medium-6e2a217a--button-4b4c5088--medium-54db2ab3 {
         display: -webkit-inline-box;
         display: -moz-inline-box;
         display: -ms-inline-flexbox;
         display: -webkit-inline-flex;
         color: #9DAAB6;
         width: 40px;
         border: 1px solid;
         cursor: pointer;
         height: 40px;
         display: inline-flex;
         outline: none;
         padding: 0;
         transition: all 250ms ease-out;
         align-items: center;
         line-height: 1em;
         white-space: nowrap;
         border-color: transparent;
         border-radius: 3px;
         -moz-transition: all 250ms ease-out;
         justify-content: center;
         text-decoration: none;
         -webkit-box-pack: center;
         background-color: transparent;
         -webkit-box-align: center;
         -webkit-transition: all 250ms ease-out;
      }

      .button-36063075--medium-6e2a217a--button-4b4c5088--medium-54db2ab3:disabled {
         opacity: 0.5;
         pointer-events: none;
      }

      .button-36063075--medium-6e2a217a--button-4b4c5088--medium-54db2ab3:hover {
         color: #3884FF;
      }

      .medium-3bde6db7--iconOnly-bddce91a {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         margin: 0;
         display: flex;
         font-size: 18px;
         align-items: center;
         justify-content: center;
         -webkit-box-pack: center;
         -webkit-box-align: center;
      }

      .text-4505230f--UIH400-4e41e82a--textUIFamily-5ebd8e40--text-8ee2c8b2 {
         font-size: 16px;
         font-family: "Roboto", sans-serif;
         font-weight: 500;
         line-height: 1em;
      }

      .reset-3c756112--sidebarMain-13701e8f--sidebarMainWithHeader-7d9d70ef {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         height: calc(100% - 80px);
         margin: 0;
         display: flex;
         padding: 0;
         overflow-y: hidden;
         flex-direction: column;
         background-color: #F5F7F9;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--sidebarMain-13701e8f--sidebarMainWithHeader-7d9d70ef {
            height: 100%;
         }
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe {
         overflow-y: auto;
         flex: 1 1 auto;
         width: 100%;
         margin: 0;
         display: block;
         padding: 0;
         overflow-x: hidden;
         overflow-y: overlay;
         -webkit-overflow-scrolling: touch;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar {
         width: 4px;
         height: 4px;
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-track {
         background: none;
         border-width: 0;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
         transition: background 250ms ease;
         border-radius: 2px;
         -moz-transition: background 250ms ease;
         -webkit-transition: background 250ms ease;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-button {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-track-piece {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-corner {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-resizer {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe:hover::-webkit-scrollbar {
         display: initial;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe:hover::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
      }

      .reset-3c756112--mobileHeader-4e2d4892 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #74818D;
         height: 59px;
         margin: 0;
         display: flex;
         padding: 0;
         box-shadow: 0 1px 1px 0 rgba(116, 129, 141, 0.1);
         align-items: stretch;
         border-bottom: 1px solid #d4dadf;
         background-color: #FFFFFF;
         -webkit-box-align: stretch;
      }

      @media screen and (min-width: 768px) {
         .reset-3c756112--mobileHeader-4e2d4892 {
            display: none;
         }
      }

      .reset-3c756112--mobileHeaderClose-47b8fa64 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         cursor: pointer;
         margin: 0;
         display: flex;
         padding: 8px 16px;
         font-size: 24px;
         align-items: center;
         -webkit-box-align: center;
      }

      .reset-3c756112--pagesTree-4b07cd56 {
         margin: 0;
         display: block;
         padding: 0;
         font-size: 15px;
         margin-top: 32px;
         padding-left: 16px;
      }

      @media screen and (min-width: 768px) {
         .reset-3c756112--pagesTree-4b07cd56 {
            padding-left: 24px;
         }
      }

      .reset-3c756112--pageItem-01e3f344 {
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
         border-left: 1px solid transparent;
      }

      .reset-3c756112--pageComponent-7cc5301a {
         margin: 0;
         display: block;
         padding: 0;
         margin-left: -1px;
      }

      .navButton-94f2579c--navButtonClickable-161b88ca {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: inherit;
         border: 1px solid transparent;
         cursor: pointer;
         display: flex;
         padding: 7px 24px 7px 16px;
         position: relative;
         align-items: center;
         border-right: 0;
         text-decoration: none;
         -webkit-box-align: center;
      }

      .navButton-94f2579c--navButtonClickable-161b88ca:hover {
         background-color: #E6ECF1;
      }

      .text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f {
         flex: 1;
         font-size: 14px;
         word-break: break-word;
         font-family: Content-font, Roboto, sans-serif;
         font-weight: 500;
         line-height: 1.5;
      }

      .reset-3c756112--pageItemWithChildren-56f27afc {
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
      }

      .reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312 {
         color: #9DAAB6;
         cursor: pointer;
         margin: -8px;
         display: block;
         padding: 8px;
         position: relative;
         font-size: 18px;
         line-height: 1;
         margin-left: 0;
      }

      .reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312:hover {
         color: #5C6975;
      }

      .navButton-94f2579c--navButtonClickable-161b88ca--navButtonOpened-6a88552e {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: inherit;
         border: 1px solid transparent;
         cursor: pointer;
         display: flex;
         padding: 7px 24px 7px 16px;
         position: relative;
         align-items: center;
         border-color: #E6ECF1 !important;
         border-right: 0;
         text-decoration: none;
         background-color: #FFFFFF;
         -webkit-box-align: center;
      }

      .navButton-94f2579c--navButtonClickable-161b88ca--navButtonOpened-6a88552e:hover {
         border-color: #E6ECF1;
         background-color: #FFFFFF;
      }

      .icon-7f6730be--text-3f89f380--pageDocumentIconExpanded-014d853c {
         width: 1em;
         height: 1em;
         transform: rotateZ(90deg);
         vertical-align: middle;
      }

      .reset-3c756112--pageChildren-56f27afc--pageDocumentChildren-2add00e7 {
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
         margin-left: 16px;
      }

      .reset-3c756112--pageChildren-56f27afc--pageDocumentChildren-2add00e7:before {
         top: 0;
         left: 0;
         width: 1px;
         bottom: 0;
         content: "";
         position: absolute;
         background: #E6ECF1;
      }

      .navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #9DAAB6;
         border: 1px solid transparent;
         cursor: pointer;
         display: flex;
         padding: 7px 24px 7px 16px;
         position: relative;
         align-items: center;
         border-right: 0;
         text-decoration: none;
         -webkit-box-align: center;
      }

      .navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca:hover {
         background-color: #E6ECF1;
      }

      .reset-3c756112--pageItemWithChildren-56f27afc--S300Bottom-9b4658d2 {
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
         margin-bottom: 24px;
      }

      .reset-3c756112--footer-68e6f18c {
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
      }

      .reset-3c756112--footer-68e6f18c:before {
         background: -webkit-linear-gradient(to bottom, rgba(255, 255, 255, 0) 0%, #F5F7F9 100%);
         background: -moz-linear-gradient(to bottom, rgba(255, 255, 255, 0) 0%, #F5F7F9 100%);
         top: -24px;
         width: 100%;
         height: 24px;
         content: "";
         display: block;
         position: absolute;
         background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 0%, #F5F7F9 100%);
      }

      .reset-3c756112--trademark-a8da4b94 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #9DAAB6;
         margin: 16px;
         display: flex;
         padding: 0;
         align-items: center;
         margin-left: 32px;
         padding-top: 8px;
         padding-left: 16px;
         border-radius: 3px;
         padding-right: 16px;
         padding-bottom: 8px;
         text-decoration: none;
         background-color: #E6ECF1;
         -webkit-box-align: center;
      }

      .reset-3c756112--trademark-a8da4b94:hover {
         color: #3884FF;
      }

      .reset-3c756112--trademarkLogo-0d2d53bc {
         margin: 0;
         display: block;
         padding: 0;
         font-size: 40px;
      }

      .reset-3c756112--trademarkContent-04a01aea {
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
         padding-left: 16px;
      }

      .text-4505230f--TextH200-a3425406--textUIFamily-5ebd8e40 {
         font-size: 12px;
         font-family: "Roboto", sans-serif;
         font-weight: 400;
         line-height: 1.625;
      }

      .reset-3c756112--wholeContentPage-6c3f1fc5 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 1 1 auto;
         margin: 0;
         display: flex;
         padding: 0;
         max-width: 100%;
         min-width: 0;
         background: #fff;
         flex-direction: column;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--wholePageSticky-f53dafd2 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 1 1 auto;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         min-width: 0;
      }

      .reset-3c756112--pageContainer-544d6e9c {
         flex: 1 1 auto;
         margin: 0px 16px;
         display: block;
         padding: 0;
         max-width: 750px;
         min-width: 0;
         padding-bottom: 64px;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--pageContainer-544d6e9c {
            margin: 0px auto;
            padding: 0px 24px 24px;
         }
      }

      @media screen and (min-width: 1024px) {
         .reset-3c756112--pageContainer-544d6e9c {
            margin: 0px 88px;
         }
      }

      .reset-3c756112--pageHeader-15724735 {
         margin: 0;
         display: block;
         padding: 0;
         border-bottom: 2px solid #E6ECF1;
         margin-bottom: 32px;
      }

      .reset-3c756112--pageHeaderInner-7c0f0284 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: auto;
         margin: 0;
         display: flex;
         padding: 40px 0px;
      }

      @media screen and (min-width: 768px) {
         .reset-3c756112--pageHeaderInner-7c0f0284 {
            flex-wrap: wrap;
            align-items: baseline;
            flex-direction: row;
            -webkit-box-align: baseline;
            -webkit-box-lines: multiple;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
         }
      }

      .reset-3c756112--pageHeaderWrapperContent-6897c946 {
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
      }

      .reset-3c756112--horizontalFlex-5a0077e0 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         margin: 0;
         display: flex;
         padding: 0;
         align-items: stretch;
         justify-content: space-between;
         -webkit-box-pack: justify;
         -webkit-box-align: stretch;
      }

      .reset-3c756112--pageHeaderIntro-0c1463da {
         flex: 1 1 auto;
         margin: 0;
         display: block;
         padding: 0;
         padding-right: 16px;
      }

      .reset-3c756112--pageTitle-33dc39a3 {
         color: #242A31;
         width: 100%;
         border: none;
         margin: 0;
         display: block;
         outline: none;
         padding: 0;
         background: none;
         border-radius: 3px;
      }

      .text-4505230f--DisplayH900-bfb998fa--textContentFamily-49a318e1 {
         font-size: 32px;
         font-family: Content-font, Roboto, sans-serif;
         font-weight: 500;
         line-height: 1.5;
      }

      .reset-3c756112--toolbar-a6a9f7d2--medium-8e46b02c--pageHeaderToolbar-6457a802--withControlsClosed-3e96e46c {
         display: -ms-inline-grid;
         margin: 0;
         display: none;
         padding: 0;
         margin-top: 9px;
         -ms-grid-rows: none;
         grid-column-gap: 16px;
         grid-template-rows: none;
      }

      @media screen and (max-width: 1279px) {
         .reset-3c756112--toolbar-a6a9f7d2--medium-8e46b02c--pageHeaderToolbar-6457a802--withControlsClosed-3e96e46c {
            display: block;
         }
      }

      .button-36063075--small-30ceeddb--button-4b4c5088--small-54db2a94 {
         display: -webkit-inline-box;
         display: -moz-inline-box;
         display: -ms-inline-flexbox;
         display: -webkit-inline-flex;
         color: #9DAAB6;
         width: 30px;
         border: 1px solid;
         cursor: pointer;
         height: 30px;
         display: inline-flex;
         outline: none;
         padding: 0;
         transition: all 250ms ease-out;
         align-items: center;
         line-height: 1em;
         white-space: nowrap;
         border-color: transparent;
         border-radius: 3px;
         -moz-transition: all 250ms ease-out;
         justify-content: center;
         text-decoration: none;
         -webkit-box-pack: center;
         background-color: transparent;
         -webkit-box-align: center;
         -webkit-transition: all 250ms ease-out;
      }

      .button-36063075--small-30ceeddb--button-4b4c5088--small-54db2a94:disabled {
         opacity: 0.5;
         pointer-events: none;
      }

      .button-36063075--small-30ceeddb--button-4b4c5088--small-54db2a94:hover {
         color: #3884FF;
      }

      .small-3bde6db7--iconOnly-bddce91a {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         margin: 0;
         display: flex;
         font-size: 18px;
         align-items: center;
         justify-content: center;
         -webkit-box-pack: center;
         -webkit-box-align: center;
      }

      .text-4505230f--UIH300-2063425d--textUIFamily-5ebd8e40--text-8ee2c8b2 {
         font-size: 14px;
         font-family: "Roboto", sans-serif;
         font-weight: 500;
         line-height: 1em;
      }

      .reset-3c756112--pageHeaderDescription-22970244 {
         flex: auto;
         margin: 0;
         display: block;
         padding: 0;
      }

      .reset-3c756112--toaster-c029690e {
         top: 16px;
         left: 50%;
         margin: 0;
         display: block;
         padding: 0;
         z-index: 160;
         position: fixed;
         transform: translateX(-50%);
      }

      .reset-3c756112--pageBody-a91db4ac {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         font-size: 16px;
         flex-direction: column;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--container-960c7c26 {
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
         margin-bottom: -24px;
      }

      .reset-3c756112--blankslateContainer-2135c5a2 {
         margin: 0;
         display: block;
         padding: 40px 0;
      }

      .reset-3c756112--blankslateToCText-55bbb7a3 {
         colors: #5C6975;
         margin: 0 0 8px 0;
         display: block;
         padding: 0;
      }

      .text-4505230f--TextH400-3033861f--textContentFamily-49a318e1 {
         font-size: 16px;
         font-family: Content-font, Roboto, sans-serif;
         font-weight: 400;
         line-height: 1.625;
      }

      .reset-3c756112--emptyPageSummary-d13a13dc {
         display: -ms-grid;
         width: 100%;
         margin: 24px 0;
         display: grid;
         padding: 0;
         grid-row-gap: 24px;
         -ms-grid-rows: auto;
         margin-bottom: 24px;
         grid-column-gap: 24px;
         justify-content: center;
         -ms-grid-columns:
            calc(50% - 8px) calc(50% - 8px);
         -webkit-box-pack: center;
         grid-template-rows: auto;
         grid-template-columns:
            calc(50% - 8px) calc(50% - 8px);
      }

      @media screen and (max-width: 1279px) {
         .reset-3c756112--emptyPageSummary-d13a13dc {
            -ms-grid-columns: 100%;
            grid-template-columns: 100%;
         }
      }

      .reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #242A31;
         border: 1px solid #E6ECF1;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         align-self: stretch;
         box-shadow: 0 3px 8px 0 rgba(116, 129, 141, 0.1);
         transition: border 250ms ease;
         align-items: center;
         justify-self: stretch;
         border-radius: 3px;
         flex-direction: row;
         -moz-transition: border 250ms ease;
         text-decoration: none;
         background-color: #FFFFFF;
         -webkit-box-align: center;
         page-break-inside: avoid;
         -ms-grid-row-align: stretch;
         -webkit-box-orient: horizontal;
         -webkit-transition: border 250ms ease;
         -ms-grid-column-align: stretch;
         -webkit-box-direction: normal;
      }

      @media screen and (max-width: 1023px) {
         .reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5 {
            flex-wrap: wrap;
            -webkit-box-lines: multiple;
         }
      }

      .link-a079aa82--primary-53a25e66 {
         color: #3884FF;
         cursor: pointer;
         text-decoration: underline;
      }

      .reset-3c756112--cardBody-25dca3b1 {
         flex: 1;
         margin: 0;
         display: block;
         padding: 16px;
      }

      .reset-3c756112--cardTitle-32aa092e {
         margin: 0;
         display: block;
         padding: 0;
         transition: color 250ms ease;
         -moz-transition: color 250ms ease;
         -webkit-transition: color 250ms ease;
      }

      .text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1 {
         font-size: 16px;
         font-family: Content-font, Roboto, sans-serif;
         font-weight: 500;
         line-height: 1.5;
      }

      .reset-3c756112--pageFooter-f1d5e2b0 {
         margin: 0;
         display: block;
         padding: 0;
         margin-top: 64px;
      }

      @media print {
         .reset-3c756112--pageFooter-f1d5e2b0 {
            display: none;
         }
      }

      .reset-3c756112--navPagesLinks-67bea901 {
         display: -ms-grid;
         width: auto;
         margin: 0;
         display: grid;
         padding: 0;
         -ms-grid-rows: auto;
         grid-column-gap: 24px;
         -ms-grid-columns: 1fr 1fr;
         grid-template-rows: auto;
         grid-template-areas: "previous next";
         grid-template-columns: 1fr 1fr;
      }

      @media screen and (max-width: 767px) {
         .reset-3c756112--navPagesLinks-67bea901 {
            grid-row-gap: 24px;
            -ms-grid-columns: 1fr;
            grid-template-areas: "next""previous";
            grid-template-columns: 1fr;
         }
      }

      .reset-3c756112--card-6570f064--whiteCard-fff091a4--cardPrevious-56a5e674 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #242A31;
         border: 1px solid #E6ECF1;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         grid-area: previous;
         align-self: stretch;
         box-shadow: 0 3px 8px 0 rgba(116, 129, 141, 0.1);
         transition: border 250ms ease;
         align-items: center;
         justify-self: stretch;
         border-radius: 3px;
         flex-direction: row;
         -moz-transition: border 250ms ease;
         text-decoration: none;
         background-color: #FFFFFF;
         -webkit-box-align: center;
         page-break-inside: avoid;
         -ms-grid-row-align: stretch;
         -webkit-box-orient: horizontal;
         -webkit-transition: border 250ms ease;
         -ms-grid-column-align: stretch;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--cardIcon-5b647d22 {
         flex: 0 0 auto;
         color: #9DAAB6;
         margin: 0;
         display: block;
         padding: 16px;
         font-size: 24px;
         transition: color 250ms ease;
         -moz-transition: color 250ms ease;
         -webkit-transition: color 250ms ease;
      }

      .reset-3c756112--cardIcon-5b647d22:first-child {
         padding-right: 0;
      }

      .reset-3c756112--cardIcon-5b647d22:last-child {
         padding-left: 0;
      }

      .reset-3c756112--cardBody-25dca3b1--cardPreviousBody-79f02c06 {
         flex: 1;
         margin: 0;
         display: block;
         padding: 16px;
         text-align: right;
      }

      .reset-3c756112--cardHint-2c5d8183 {
         color: #9DAAB6;
         margin: 0;
         display: block;
         padding: 0;
      }

      .text-4505230f--TextH200-a3425406--textContentFamily-49a318e1 {
         font-size: 12px;
         font-family: Content-font, Roboto, sans-serif;
         font-weight: 400;
         line-height: 1.625;
      }

      .reset-3c756112--card-6570f064--whiteCard-fff091a4--cardNext-19241c42 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #242A31;
         border: 1px solid #E6ECF1;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         grid-area: next;
         align-self: stretch;
         box-shadow: 0 3px 8px 0 rgba(116, 129, 141, 0.1);
         transition: border 250ms ease;
         align-items: center;
         justify-self: stretch;
         border-radius: 3px;
         flex-direction: row;
         -moz-transition: border 250ms ease;
         text-decoration: none;
         background-color: #FFFFFF;
         -webkit-box-align: center;
         page-break-inside: avoid;
         -ms-grid-row-align: stretch;
         -webkit-box-orient: horizontal;
         -webkit-transition: border 250ms ease;
         -ms-grid-column-align: stretch;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--pageFooterColumns-ef8f347e {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         margin: 0;
         display: flex;
         padding: 0;
         border-top: 2px solid #E6ECF1;
         margin-top: 24px;
         align-items: center;
         padding-top: 24px;
         flex-direction: row;
         -webkit-box-align: center;
         -webkit-box-orient: horizontal;
         -webkit-box-direction: normal;
      }

      @media screen and (max-width: 767px) {
         .reset-3c756112--pageFooterColumns-ef8f347e {
            align-items: stretch;
            flex-direction: column;
            -webkit-box-align: stretch;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
         }
      }

      .reset-3c756112--pageFooterSummary-12074aff {
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
      }

      @media screen and (max-width: 767px) {
         .reset-3c756112--pageFooterSummary-12074aff {
            margin-bottom: 16px;
         }
      }

      .reset-3c756112--pageChangesSummary-08821678 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: auto;
         margin: 0;
         display: flex;
         padding: 0;
         align-items: center;
         -webkit-box-align: center;
      }

      .reset-3c756112--pageEditedDate-b805c39a {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: auto;
         color: #9DAAB6;
         margin: 0;
         display: flex;
         padding: 0;
      }

      .reset-3c756112--pageSide-ad9fed26 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 0 0 auto;
         width: 224px;
         margin: 0;
         display: flex;
         padding: 0;
         position: relative;
         margin-right: auto;
      }

      @media print {
         .reset-3c756112--pageSide-ad9fed26 {
            display: none;
         }
      }

      @media screen and (max-width: 1279px) {
         .reset-3c756112--pageSide-ad9fed26 {
            display: none;
         }
      }

      .reset-3c756112--stickyContainer-2bed3a82 {
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
         max-width: 100%;
      }

      .reset-3c756112--tocWrapper-506ea24c {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         height: 100%;
         margin: 0;
         display: flex;
         padding: 0;
         padding-top: 40px;
         flex-direction: column;
         padding-bottom: 40px;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114 {
         overflow-y: auto;
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
         overflow-x: hidden;
         overflow-y: overlay;
         -webkit-overflow-scrolling: touch;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar {
         width: 4px;
         height: 4px;
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-track {
         background: none;
         border-width: 0;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
         transition: background 250ms ease;
         border-radius: 2px;
         -moz-transition: background 250ms ease;
         -webkit-transition: background 250ms ease;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-button {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-track-piece {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-corner {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-resizer {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114:hover::-webkit-scrollbar {
         display: initial;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114:hover::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
      }

      .reset-3c756112--menu-5b8a7448--pageSideMenu-23bebfd3--pageSideSection-542f1fd5 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         flex: 0 0 auto;
         margin: 0;
         display: flex;
         padding: 0;
         overflow: hidden;
         position: relative;
         min-width: 220px;
         margin-bottom: 24px;
         flex-direction: column;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
      }

      .reset-3c756112--menu-5b8a7448--pageSideMenu-23bebfd3--pageSideSection-542f1fd5:before {
         top: 0;
         left: 0;
         height: 100%;
         content: " ";
         position: absolute;
         border-left: 1px solid #E6ECF1;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5 {
         overflow-y: auto;
         flex: 1;
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
         overflow-x: hidden;
         overflow-y: overlay;
         -webkit-overflow-scrolling: touch;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5::-webkit-scrollbar {
         width: 4px;
         height: 4px;
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5::-webkit-scrollbar-track {
         background: none;
         border-width: 0;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
         transition: background 250ms ease;
         border-radius: 2px;
         -moz-transition: background 250ms ease;
         -webkit-transition: background 250ms ease;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5::-webkit-scrollbar-button {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5::-webkit-scrollbar-track-piece {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5::-webkit-scrollbar-corner {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5::-webkit-resizer {
         display: none;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5:hover::-webkit-scrollbar {
         display: initial;
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5:hover::-webkit-scrollbar-thumb {
         background: rgba(0, 0, 0, .16);
      }

      .reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageSideMenuItems-67c61496--pageSideSection-542f1fd5:before {
         top: 0;
         left: 0;
         height: 100%;
         content: " ";
         position: absolute;
         border-left: 1px solid #E6ECF1;
      }

      .reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageSideMenuItem-22949732 {
         display: -webkit-box;
         display: -moz-box;
         display: -ms-flexbox;
         display: -webkit-flex;
         color: #242A31;
         cursor: pointer;
         margin: 0;
         display: flex;
         padding: 4px 16px;
         align-items: center;
         padding-left: 24px;
         vertical-align: middle;
         text-decoration: none;
         -webkit-box-align: center;
      }

      .reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageSideMenuItem-22949732:hover {
         background: #F5F7F9;
      }

      .reset-3c756112--menuItemIcon-206eb252 {
         display: -webkit-inline-box;
         display: -moz-inline-box;
         display: -ms-inline-flexbox;
         display: -webkit-inline-flex;
         color: #9DAAB6;
         margin: 0;
         display: inline-flex;
         padding: 0;
         font-size: 18px;
         margin-right: 8px;
      }

      .reset-3c756112--menuItemContent-c44ec79e {
         margin: 0;
         display: block;
         padding: 0;
         overflow: hidden;
         white-space: nowrap;
         text-overflow: ellipsis;
      }

      .text-4505230f--UIH300-2063425d--textUIFamily-5ebd8e40 {
         font-size: 14px;
         font-family: "Roboto", sans-serif;
         font-weight: 500;
         line-height: 1.5;
      }

      .reset-3c756112--pageSideSection-542f1fd5 {
         margin: 0;
         display: block;
         padding: 0;
         position: relative;
      }

      .reset-3c756112--pageSideSection-542f1fd5:before {
         top: 0;
         left: 0;
         height: 100%;
         content: " ";
         position: absolute;
         border-left: 1px solid #E6ECF1;
      }
   </style>
</head>

<body>
   <div class="reset-3c756112--blankslateContainer-2135c5a2">
      <div class="reset-3c756112--blankslateToCText-55bbb7a3"><span
            class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1">Here are the articles in this
            section:</span></div>
      <div class="reset-3c756112--emptyPageSummary-d13a13dc"><a
            class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/pre-registration" style="">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e" style=""><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Pre-Registration</span></div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/registration-client" style="">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e" style=""><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Registration</span></div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/registration-processor" style="">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e" style=""><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Registration Processor</span>
               </div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/id-repository" style="">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e" style=""><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">ID Repository</span></div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/id-authentication" style="">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e" style=""><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">ID Authentication</span></div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/resident-services">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e"><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Resident Services</span></div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/partner-management">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e"><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Partner Management</span></div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/admin">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e"><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Administration</span></div>
            </div>
         </a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--card-5e635eb5" readonly=""
            href="/platform/modules/kernel" style="">
            <div class="reset-3c756112--cardBody-25dca3b1">
               <div class="reset-3c756112--cardTitle-32aa092e" style=""><span
                     class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Kernel</span></div>
            </div>
         </a></div>
   </div>
</body>

</html>