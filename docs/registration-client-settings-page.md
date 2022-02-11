# Registration Client Settings page

## Settings Schema

Default settings schema is configured as below:
```
[
	{
		"name":"scheduledjobs",
		"description":{
			"ara":"إعدادات الوظائف المجدولة",
			"fra":"Paramètres des travaux planifiés",
			"eng":"Scheduled Jobs Settings"
		},
		"label":{
			"ara":"إعدادات الوظائف المجدولة",
			"fra":"Paramètres des travaux planifiés",
			"eng":"Scheduled Jobs Settings"
		},
		"fxml":"ScheduledJobsSettings.fxml",
		"icon":"scheduledjobs.png",
		"order":"1",
		"shortcut-icon":"scheduledjobs-shortcut.png",
		"access-control":[
			"REGISTRATION_SUPERVISOR"
		]
	},
	{
		"name":"globalconfigs",
		"description":{
			"ara":"إعدادات التكوين العامة",
			"fra":"Paramètres de configuration globale",
			"eng":"Global Config Settings"
		},
		"label":{
			"ara":"إعدادات التكوين العامة",
			"fra":"Paramètres de configuration globale",
			"eng":"Global Config Settings"
		},
		"fxml":"GlobalConfigSettings.fxml",
		"icon":"globalconfigs.png",
		"order":"2",
		"shortcut-icon":"globalconfigs-shortcut.png",
		"access-control":[
			"REGISTRATION_SUPERVISOR"
		]
	},
	{
		"name":"devices",
		"description":{
			"ara":"إعدادات الجهاز",
			"fra":"Réglages de l'appareil",
			"eng":"Device Settings"
		},
		"label":{
			"ara":"إعدادات الجهاز",
			"fra":"Réglages de l'appareil",
			"eng":"Device Settings"
		},
		"fxml":"DeviceSettings.fxml",
		"icon":"devices.png",
		"order":"3",
		"shortcut-icon":"devices-shortcut.png",
		"access-control":[
			"REGISTRATION_SUPERVISOR",
			"REGISTRATION_OFFICER"
		]
	}
]
```

Clicking on ![](https://user-images.githubusercontent.com/22977936/153556397-66c832bb-a627-48eb-8359-bd774a848d01.png) in the home page opens a pop-up displaying configured **Settings** page as per the above sample settings schema.

![settings pop-up ](https://user-images.githubusercontent.com/22977936/153556279-b389ef7c-1988-4242-a794-5130c0cf0768.png)


## Device settings
* All the connected devices are listed in this page.
* Option to scan for SBI for any specific port range is available in this page.
* If more than one device is idenitied, operator can choose amongst the listed devices to set the default device for the current login session.
* Access control on this page is controlled via the settings-schema. 

![](https://user-images.githubusercontent.com/22977936/153555583-403eba9c-e9c4-4e79-8959-f7c69077382b.png)


## Global configuration
* All the Registration Client related configuration key-value pairs are listed in this page.
* Operator can set the local preference on the server configraton value, applicable only for permitted configuration keys.
* Access control on this page is controlled via the settings-schema.

![](https://user-images.githubusercontent.com/22977936/153555984-b3ce16ff-0ccf-4e04-a907-d21d11b90b72.png)


## Scheduled Jobs
* All the available background jobs are listed here along with their cron expression.
* Every job's next and previous trigger time is listed along with the job name.
* Privileged operator can update the cron expression of any job.
* `Synchornize Data` in home page will trigger all of these listed jobs with just one click.
* If the operator needs to trigger specific job, the same can be handled in this page.
* Access control on this page is controlled via the settings-schema.

![](https://user-images.githubusercontent.com/22977936/153555746-b3778d29-d3ef-4d7d-be05-69444ff07d9f.png)

