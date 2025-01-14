% Tegangan Referensi_Base Tegangan
feeder_V = 20000; %20kV

%% bus data
 %bus_i  Pd(kW)   Qd(kW)    
bus=[
            1	0         0  	  
            2	144.5     89.55  
            3	72.25     44.78     	
            4	72.25     44.78     
            5	72.25     44.78     
            6	102.0     63.21    
            7	72.25     44.78	  
            8	0         0 	   
            9	144.5     89.55   	
            10	0         0       
            11	42.5      26.34   
            12	27.63     17.12    
            13	0         0       
            14	55.25     34.24    
            15	0         0        
            16	68        42.14    
            17	85        52.67    
            18	59.5      36.87    
            19	29.76     18.44    
            20	238       147.45   
            21	0         0       
            22	0         0        
            23	80        52.67    
            24	80        52.67	  
            25	68        42.14	  
            26	0         0         
            27	59.5      36.87   
            28	0         0      
            29	0         0      
            30	42.5      26.34	  
            31	80        52.67     
            32	119       73.74	  
            33  0         0  	  
            34  59.5      36.87   
            35  0         0  	  
            36	119       73.74	  
            37  0         0  	  
            38  119       73.74	  
            39  68        42.14	  
            40  42.5      26.34	  
            41  0         0  	  
            42  0         0  	  
            43  14.87     9.22	  
            44  95.20     global_best_position(1,1)	  %Pasang DSTATCOM 59 KVAr
            45  42.5      26.34	  
            46  42.5      26.34	  
            47  0         0  	  
            48  119       73.74   
            49  0         0  	  
            50  0         0  	  
            51  85        52.67   
            52  0         0  	  
            53  0         0  	  
            54  425       73.75   
            55  59.5      36.92   
            56  95.2      59  	  
            57  0         0  	 
            58  95.2      59  	  
            59  59.5      36.87	  
            60  68        42.14	  
            61  68        42.14	  
            62  0         0  	  
            63  42.5      26.34   
            64  0         0  	  
            65  68        42.14	  
            66  42.5      26.34   
            67  42.5      26.34   
            68  0         0  	  
            69  42.5      26.34   
            70  42.5      26.34   
            71  0         0  	  
            72  68        42.14	  
            73  42.5      26.34   
            74  21.26     13.17  
            75  42.5      26.34   
            76  0         0  	  
            77  535.5     331.87 
            78  42.5      26.34   
            79  21.26     13.17   
            80  59.5      36.87   
            81  59.5      36.87   
            82  6.37      3.96    
            83  29.76     18.44   
            84  0         0  	  
            85  21.26     13.17   
            86  10.63     6.59    
            87  0         0  	 
            88  119       73.74	  
            89  0         0  	  
            90  21.26     13.17   
            91  25.5      15.82	  
            92	14.87     9.22    ];

bus(:, 2:3) = bus(:, 2:3)*1000;  % loads are in kW

%% branch data
       %line_i fbus	  tbus	  r	       x
branch=[ 
         1   1      2     0.82250    0.28703   
           2   2      3     0.06900    0.11700   
           3   3      4     0.06900    0.11700  
           4   4      5     0.06900    0.11700    
           5   5      6     0.13800    0.23400    
           6   6      7     0.13800    0.23400   
           7   7      8     0.13900    0.23400 
           8   8      9     0.02200    0.01950   
           9   8      10    0.01150    0.01950   
          10   10     11    0.02200    0.01950   
          11   10     12    0.01150    0.01950   
          12   12     13    0.01150    0.01950   
          13   13     14    0.02200    0.01950   
          14   13     15    0.01150    0.01950    
          15   15     16    0.06600    0.05850   
          16   15     18    0.03450    0.05850   
          17   16     17    0.13200    0.11700  
          18   18     19    0.03450    0.05850    
          19   19     20    0.03450    0.05850  
          20   20     21    0.01150    0.01950   
          21   21     22    0.06600    0.05850    
          22   21     26    0.03450    0.05850    
          23   22     23    0.13200    0.11700  
          24   22     24    0.01150    0.01950   
          25   24     25    0.01150    0.01950 
          26   26     27    0.03450    0.05850
          27   26     28    0.08050    0.13650
          28   28     29    0.08050    0.13650
          29   28     32    0.03450    0.05850  
          30   29     30    0.08050    0.13650
          31   29     31    0.08050    0.13650   
          32   32     33    0.03450    0.05850
          33   33     34    0.02300    0.03900
          34   33     35    0.03450    0.05850
          35   35     36    0.06900    0.11700
          36   35     37    0.03450    0.05850
          37   35     39    0.15400    0.13650
          38   37     38    0.01150    0.01950 
          39   37     41    0.03450    0.05850
          40   39     40    0.15400    0.13650
          41   40     42    0.08050    0.13650
          42   41     43    0.01150    0.01950
          43   41     44    0.03450    0.05850
          44   42     45    0.03450    0.05850
          45   42     50    0.15400    0.13650
          46   44     47    0.11500    0.19500
          47   47     48    0.11500    0.19500
          48   47     49    0.11500    0.19500
          49   49     54    0.06900    0.11700
          50   49     55    0.01150    0.01950
          51   50     46    0.03450    0.05850
          52   50     51    0.15400    0.13650
          53   51     52    0.15400    0.13650
          54   52     53    0.15400    0.13650
          55   52     60    0.08050    0.13650 
          56   53     61    0.08050    0.13650
          57   53     62    0.15400    0.13650
          58   54     56    0.02300    0.03900
          59   55     57    0.11500    0.19500  
          60   57     58    0.04600    0.07800
          61   57     59    0.11500    0.19500
          62   62     63    0.15400    0.13650
          63   62     64    0.30800    0.27300
          64   64     65    0.08050    0.13650 
          65   64     68    0.15400    0.13650
          66   65     66    0.08050    0.13650 
          67   66     67    0.08050    0.13650
          68   68     69    0.08050    0.13650
          69   68     70    0.15400    0.13650
          70   70     71    0.15400    0.13650
          71   71     72    0.18400    0.31200
          72   71     73    0.13800    0.23400
          73   71     74    0.15400    0.13650
          74   74     75    0.15400    0.13650
          75   75     76    0.15400    0.13650
          76   76     77    0.08477    0.13652
          77   76     78    0.08050    0.13650
          78   78     79    0.08050    0.13650
          79   79     80    0.08050    0.13650
          80   80     81    0.08050    0.13650
          81   81     82    0.16100    0.27300
          82   82     83    0.08050    0.13650
          83   83     84    0.08050    0.13650
          84   84     85    0.08050    0.13650
          85   84     86    0.08050    0.13650
          86   86     87    0.08050    0.13650
          87   87     88    0.08050    0.13650
          88   87     89    0.08050    0.13650
          89   89     90    0.08050    0.13650
          90   89     91    0.08050    0.13650
          91   91     92    0.08050    0.13650];
      % Input Kromosom ke Bus Data Untuk LF
% global_best_position(1,1)=bus(44,3);
main;
% [T_Bus, T_Branch] = display_results(V, feeder_V, Ibr, branch, losses)
% figure(2)
% fprintf('\n')
% fprintf('Total Biaya Pembangkitan = %10.2f',test)
% fprintf(' $/hr\n')
% fprintf('\n')
