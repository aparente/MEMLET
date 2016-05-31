function probability=TwoPhaseHypo(t,k1,k2,varargin)


  metaData=struct('name','Two Phase HypoExponential',...
            'PDF',   '(k1*k2)/(k2-k1)*(exp(-t*k1)-exp(-t*k2))',...
                     'dataVar','t',...                    
                    'fitVar', 'k1,k2',...
                      'ub',   '1000,1000',...
                    'lb',   '0,0',...
                    'guess','10,1');
      
 if nargin==1;
      limtype=t;
      switch limtype
        case 0
        case 1
      metaData.PDF='(k1*k2)/(k2-k1)*(exp(-t*k1)-exp(-t*k2))/(((k2)/(k2-k1)*(exp(-tmin*k1))-(k1)/(k2-k1)*(exp(-tmin*k2))))';
         end 
      probability=metaData;
    return
  
 end
 
  if nargin==4
      tmin=varargin{1};
     probability =  (k1.*k2)./(k2-k1).*(exp(-t.*k1)-exp(-t.*k2))./(((k2)./(k2-k1).*(exp(-tmin.*k1))-(k1)./(k2-k1).*(exp(-tmin.*k2))));
  else
  probability=(k1.*k2)./(k2-k1).*(exp(-t.*k1)-exp(-t.*k2));
  end 