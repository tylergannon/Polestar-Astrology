

function sign(X)
{
   var Sign

   if (x==0)
   {
      Sign = 1
   }
   else
   {
      Sign = X/Math.abs(X)
   }

   return Sign
}

function fix(X)
{
   var Fix

   Fix = Math.floor(Math.abs(X))*sign(X)

   return Fix
}



function sollon2jd(Long, Month, Year)
{
   // Written By Eran O. Ofek (All right reserved)
   //August 2000

   var N
   var JDM0
   var Dt
   var RAD
   var ApproxJD
   var JD1
   var JD
   var DiffJD

   RAD = 57.29577951308232;

   Long = Long/RAD;

   N = Year - 2000;

   if (Math.abs(N)>100)
   {
      alert("Algorithm is not stable for years below 1900 or above 2100");
   }


   JDM0 = 2451182.24736 + 365.25963575*N;

   // calc approximate JD
   ApproxJD = date2jd(15, Month, Year)


   DiffJD = ApproxJD-2451545

   Dt = 1.94330*Math.sin(Long - 1.798135) + 0.01305272*Math.sin(2*Long + 2.634232) + 78.195268 + 58.13165*Long - 0.0000089408*DiffJD



   if (Math.abs(ApproxJD - (JDM0 + Dt))>50)
   {
      Dt = Dt + 365.2596
   }

   JD1 = JDM0 + Dt;

   jd2date(JD1);

   JD = Math.round(JD1*100)

   return JD/100



}

function jd2date(JD)
{

   var Z
   var F
   var Alpha
   var A
   var B
   var C
   var D
   var E
   var YearVal
   var MonthVal
   var DayVal
   var HourVal


   Z = Math.floor(JD+0.5)
   F = JD+0.5-Z

   if (Z<2299161)
   {
      A = Z
   }
   else
   {
      Alpha = Math.floor((Z-1867216.25)/36524.25)
      A     = Z + 1 + Alpha - Math.floor(0.25*Alpha) 
   }

   B = A + 1524
   C = Math.floor((B-122.1)/365.25)
   D = Math.floor(365.25*C)
   E = Math.floor((B-D)/30.6001)

   DayVal   = B - D - Math.floor(30.6001*E)

   if (E<14)
   {
      MonthVal = E - 1
   }
   else
   {
      MonthVal = E - 13
   }

   if (MonthVal>2)
   {
      YearVal = C - 4716
   }
   else
   {
      YearVal = C - 4715
   }

   HourVal = Math.round(F*24)

   return [YearVal, MonthVal, DayVal, HourVal]

}



function date2jd(Day, Month, Year)
{
   // Written By Eran O. Ofek (All right reserved)
   //December 1998 
   var A
   var B
   var DayFrac
   var JD
   var DayOfWeek


   DayFrac = Day - Math.floor(Day)
   Day = Math.floor(Day)
   A = 0
   B = 0
   if (Month < 3)
   {
      if (Month==1)
      {
         Month = 13
      }
      else
      {
         Month = 14
      }
      Year  = Year - 1
   }
   if ((Year>1582) || ((Year==1582) && (Month>10)) || ((Year==1582) && (Month==10) && (Day>=15)))
   {
      A = Math.floor(Year/100)
      B = 2 - A + Math.floor(A/4)
   }
   JD = Math.floor(365.25*Year + 365.25*4716.0) + Math.floor(30.6001*Month + 30.6001) + Day + B - 1524.5 + DayFrac

   
   //calculate day of week
   DayOfWeek = (JD-0.5) % 7 + 3
   if (DayOfWeek > 7)
   {
      DayOfWeek = DayOfWeek - 7
   }
   

   return JD

}
