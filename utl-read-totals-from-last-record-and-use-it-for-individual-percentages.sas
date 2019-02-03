Calculate percentages from grand total when last row in data set is grand total                                                   
                                                                                                                                  
SAS Forum                                                                                                                         
https://tinyurl.com/yde9jrrk                                                                                                      
https://communities.sas.com/t5/SAS-Programming/Calculate-percentage-from-grand-total-when-last-row-in-data-set/m-p/530544         
                                                                                                                                  
Elegant solution by Kurt Bremser                                                                                                  
https://communities.sas.com/t5/user/viewprofilepage/user-id/11562      

Nice enhancement by                                                             
Paul Dorfman <sashole@BELLSOUTH.NET>                                            
                                                                                
Which will work regardless of where "Total" is located. And                     
                                                                                                                                                                                                                          
data want (drop = _:) ;                                                         
  if _n_ = 1 then set have (where=(category="Total") rename=(total=_t)) ;       
  set have ;                                                                    
  pct = 100 * divide (total, _t) ;                                              
run ;                                                                           
                                                                                
                                                                                                                                 
                                                                                                                                  
INPUT                                                                                                                             
=====                                                                                                                             
                                                                                                                                  
Data have;                                                                                                                        
input category $ total;                                                                                                           
cards4;                                                                                                                           
a  20                                                                                                                             
b  50                                                                                                                             
c  80                                                                                                                             
d  40                                                                                                                             
e  10                                                                                                                             
Total 200                                                                                                                         
;;;;                                                                                                                              
run;quit;                                                                                                                         
                                                                                                                                  
/*                                                                                                                                
 WORK.HAVE total obs=6                                                                                                            
                                                                                                                                  
  CATEGORY    TOTAL                                                                                                               
                                                                                                                                  
   a            20                                                                                                                
   b            50                                                                                                                
   c            80                                                                                                                
   d            40                                                                                                                
   e            10                                                                                                                
   Total       200                                                                                                                
*/                                                                                                                                
                                                                                                                                  
EXAMPLE OUTPUT                                                                                                                    
--------------                                                                                                                    
                                                                                                                                  
WORK.WANT total obs=6                                                                                                             
                                                                                                                                  
  CATEGORY    TOTAL     PCT                                                                                                       
                                                                                                                                  
   a            20     10.00%                                                                                                     
   b            50     25.00%                                                                                                     
   c            80     40.00%                                                                                                     
   d            40     20.00%                                                                                                     
   e            10      5.00%                                                                                                     
   Total       200     100.0%                                                                                                     
                                                                                                                                  
                                                                                                                                  
*          _       _   _                                                                                                          
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                               
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                              
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                             
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                             
                                                                                                                                  
;                                                                                                                                 
                                                                                                                                  
data want;                                                                                                                        
if _n_ = 1 then set have (keep=total rename=(total=grand)) nobs=nobs point=nobs;                                                  
set have;                                                                                                                         
pct = total / grand;                                                                                                              
format pct percent8.2;                                                                                                            
drop grand;                                                                                                                       
run;                                                                                                                              
                                                                                                                                  
proc print data=want noobs;                                                                                                       
run;                                                                                                                              
                                                                                                                                  
                                                                                                                                  
