# ID-Authentication Demographic Data Normalization

Demographic data normalization is the process of applying rules for formatting of the demographic data (such as the address) into a common format before demographic data matching is verified during the demographic authentication in IDA. For example, for address lines, the '1st Street' can be replaced with '1 st' and 'C/o' can be removed from both the input and database data before the match is verified. These rules will be different for different languages, and may be configured/implemented differently.

The ID-Authentication Demographic data normalization mentioned here is specific to the [Demo-SDK reference implementation](https://github.com/mosip/demosdk) of the [Kernel Demographic API](https://github.com/mosip/commons/tree/master/kernel/kernel-demographics-api). It takes the below configuration to apply the name and address normalization rules.

For any other custom implementation of the normalization, the Demo-SDK needs to be implemented accordingly.
 
## Demographic name/address normalization using regular expressions and their replacement configurations

The below configuration is used to define the separator for normalizing regex (pattern) and the replacement word. The default is set to '='.
   
`ida.norm.sep==`

The format for configuring the name/address normalization rules for any language is given below:

`ida.demo.<name/address/common>.normalization.regex.<languageCode/any>[<sequential index starting from 0>]=<reqular expression>${ida.norm.sep}<replacement string>`

    * name/address/common - type of normalization, common applies to both name and address
    
    * languageCode - this is the code for languages like hin, eng, any('any' applies to any language)

If replacement string is not specified, the regular expression will be replaced with empty string.
  
_Note_: It is recommended that the sequence is not broken in the middle otherwise all normalization properties will not be read for the particular type.
  
## Normalization rules for English language

~~~
ida.demo.address.normalization.regex.eng[0]=[CcSsDdWwHh]/[Oo]
ida.demo.address.normalization.regex.eng[1]=(M|m|D|d)(rs?)(.)
ida.demo.address.normalization.regex.eng[2]=(N|n)(O|o)(\\.)?
ida.demo.address.normalization.regex.eng[3]=[aA][pP][aA][rR][tT][mM][eE][nN][tT]${ida.norm.sep}apt 
ida.demo.address.normalization.regex.eng[4]=[sS][tT][rR][eE][eE][tT]${ida.norm.sep}st 
ida.demo.address.normalization.regex.eng[5]=[rR][oO][aA][dD]${ida.norm.sep}rd 
ida.demo.address.normalization.regex.eng[6]=[mM][aA][iI][nN]${ida.norm.sep}mn 
ida.demo.address.normalization.regex.eng[7]=[cC][rR][oO][sS][sS]${ida.norm.sep}crs 
ida.demo.address.normalization.regex.eng[8]=[oO][pP][pP][oO][sS][iI][tT][eE]${ida.norm.sep}opp 
ida.demo.address.normalization.regex.eng[9]=[mM][aA][rR][kK][eE][tT]${ida.norm.sep}mkt 
ida.demo.address.normalization.regex.eng[10]=1[sS][tT]${ida.norm.sep}1 
ida.demo.address.normalization.regex.eng[11]=1[tT][hH]${ida.norm.sep}1 
ida.demo.address.normalization.regex.eng[12]=2[nN][dD]${ida.norm.sep}2 
ida.demo.address.normalization.regex.eng[13]=2[tT][hH]${ida.norm.sep}2 
ida.demo.address.normalization.regex.eng[14]=3[rR][dD]${ida.norm.sep}3 
ida.demo.address.normalization.regex.eng[15]=3[tT][hH]${ida.norm.sep}3 
ida.demo.address.normalization.regex.eng[16]=4[tT][hH]${ida.norm.sep}4 
ida.demo.address.normalization.regex.eng[17]=5[tT][hH]${ida.norm.sep}5 
ida.demo.address.normalization.regex.eng[18]=6[tT][hH]${ida.norm.sep}6 
ida.demo.address.normalization.regex.eng[19]=7[tT][hH]${ida.norm.sep}7 
ida.demo.address.normalization.regex.eng[20]=8[tT][hH]${ida.norm.sep}8 
ida.demo.address.normalization.regex.eng[21]=9[tT][hH]${ida.norm.sep}9 
ida.demo.address.normalization.regex.eng[22]=0[tT][hH]${ida.norm.sep}0 
# Note: the common normalization attributes will be replaced at the end.
# Special characters are removed : . , - * ( ) [ ] ` ' / \ # "
# Replace special char with space. Trailing space is removed from property. As a workaround first replacing with " ." then removing the "."
ida.demo.common.normalization.regex.any[0]=[\\.|,|\\-|\\*|\\(|\\)|\\[|\\]|`|\\'|/|\\|#|\"]${ida.norm.sep} .
# Trailing space is removed from property. As a workaround first replacing with " ." then removing the "."
ida.demo.common.normalization.regex.any[1]=\\s+${ida.norm.sep} .
ida.demo.common.normalization.regex.any[2]=\\.${ida.norm.sep}
~~~

## Normalization rules for Non-English language

For non-english languages, the non-english words needs to be converted into UTF-16 and then copied to the configuration. 
For example, convert the Unicode characters to UTF-16.

Before conversion: `ida.demo.address.normalization.regex.hin[0]=पहली${ida.norm.sep}पहला`

After conversion: `ida.demo.address.normalization.regex.hin[0]=\u092a\u0939\u0932\u0940${ida.norm.sep}\u092a\u0939\u0932\u093e`



