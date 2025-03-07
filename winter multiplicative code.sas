/*
 *
 * Task code generated by SAS Studio 3.8 
 *
 * Generated on '2/26/23, 4:02 PM' 
 * Generated by 'rohit' 
 * Generated on server 'ROHITHA.HSD1.CT.COMCAST.NET.' 
 * Generated on SAS platform 'X64_10HOME WIN' 
 * Generated on SAS version '9.04.01M6P11152018' 
 * Generated on browser 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' 
 * Generated on web client 'http://localhost:49298/main?locale=en_US&zone=GMT-05%253A00&sutoken=%257B8487E4D7-F86E-4D76-8B58-F64770C8DC7F%257D' 
 *
 */

ods noproctitle;
ods graphics / imagemap=on;

proc sort data=ROM.ELECPROD out=Work.preProcessedData;
	by DATE;
run;

proc esm data=Work.preProcessedData back=12 lead=83 seasonality=12 plot=(acf 
		corr errors wn forecasts forecastsonly modelforecasts) out=work.outmul 
		outstat=work.outstatmul outfor=work.outformul;
	id DATE interval=month;
	forecast Electricity_Production / alpha=0.05 model=winters transform=none;
run;

proc delete data=Work.preProcessedData;
run;