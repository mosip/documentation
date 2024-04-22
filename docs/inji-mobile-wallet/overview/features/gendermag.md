# GenderMag

## What is GenderMag?

The **GenderMag Methodology** aims to analyze and mitigate gender biases in users’ problem-solving interactions with software. It underscores the importance of accounting for gender differences in human-computer interaction (HCI) during the software design process.

**Process**

1. We identified two personas based on their familiarity with technology and their ability to embrace technological progress. The personas are:
   * Abi, who is either Abigail or Abishek, is 45 years old. She works as a homemaker, is literate, but not very tech- savvy. Her internet connectivity is moderate, and she does not have a personal phone.
   * Tim, who is either Timothy or Timara, a 24-year-old financial consultant, is literate, tech-savvy, and boasts excellent internet connectivity. Additionally, he owns the latest phone.
2. Examine the feature, systematically walk through the process, assess their information handling, and pinpoint any problems.

During the walkthrough, we pinpointed inclusivity concerns in the Inji mobile app’s user interface and experience. Subsequently, we took steps to mitigate these issues, aiming to eliminate digital entry barriers.

As part of Phase1, below P1 items are fixed in the v0.11.0-Inji release:



<table><thead><tr><th width="86">Sl No</th><th>Problem statement</th><th>Solution</th><th>Jira number</th></tr></thead><tbody><tr><td>1</td><td><p>The term “scan” can be ambiguous because scanning a QR code within an app might result in a money transfer from a bank account. This perception could be influenced by cultural factors. Abi, instead of directly clicking on the “Scan” option, prefers to select her card and then look for a “Share” option. Unless external assistance is available, Abi will avoid using the “Scan” feature.          </p><p></p><p>Without external assistance, unless there are instructions visibly posted on the wall, she might find it challenging to comprehend whether she needs to select the “scan” option. </p></td><td>The Scan Button in the Navigation Bar can now be referred to as “Share”.</td><td><p><a href="https://mosip.atlassian.net/browse/INJIMOB-725">INJIMOB-725</a></p><p><a href="https://mosip.atlassian.net/browse/INJIMOB-702">INJIMOB-702</a></p><p><br></p></td></tr><tr><td>2</td><td><p>On the "Retrieve your ID" screen, instead of using "VID auto population," consider using "Download ID." This change will help avoid confusion for Abi, who might expect an explanation of what VID / UIN IDs are.        </p><p></p><p>On the "Home with cards view," Abi might wonder why her card displays "Activation Pending," while the other card shows Activated for online login".</p></td><td><p>In the FAQ or Help section, provide information about the various types of IDs, their locations, and instructions on how to download them using different ID methods.     </p><p></p><p>Provide additional information related to "Activation Pending," and ensure clear icon translations for "Activation Done" versus "Activation Pending".</p></td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-698">INJIMOB-698</a></td></tr><tr><td>3</td><td><ol><li>When the user clicks on the "Add" button, the options "Generate your card" or "Retrieve your ID" might be confusing.</li><li>The description should also include an explanation of why the verification process is necessary.</li><li>When the user glances at the screen, the "AID"  is not immediately evident.</li></ol></td><td><ol><li>Update main screen name to "Download your card".</li><li>Update main screen description to "Select ID type and enter the MOSIP provided UIN or VID you wish to download." (Also, with a reference to upcoming OTP screen).</li><li>Enhance the text to provide a heads up about the upcoming step of OTP verification, so that user is prepared to receive and enter the OTP.</li><li>Update bottom line text to "Don't have UIN / VID? Get it now using your AID."</li></ol></td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-697">INJIMOB-697</a></td></tr></tbody></table>