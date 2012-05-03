

 ############
 # Title: [scheduleload]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\scheduleload.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "scheduleload";
 set xlabel "TIME [sec]";
 set autoscale x;
 set ylabel "TIME FUNCTION";
 set autoscale y;
 plot '.\FIGURES\scheduleload.mdt' using 1:2 title "History" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [constloaddistTable]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\constloaddistTable.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "constloaddistTable";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DISTRIBUTED FORCE ALONG i3 [N/m]";
 set autoscale y;
 plot '.\FIGURES\constloaddistTable.mdt' using 1:2 title "Fi3" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [OriDist]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\OriDist.eps';
 set key; set border; set grid; set multiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set style line  2 lt  2 lw 3.0 pt  2 ps 1.5;
 set style line  3 lt  3 lw 3.0 pt  3 ps 1.5;
 set title "OriDist";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "TWIST ANGLE [deg]";
 set autoscale y;
 plot '.\FIGURES\OriDist.mdt' using 1:2 title "Phi" with lines linestyle 1 , \
 set nomultiplot;
 set output;

 ############
 # Title: [curveAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveABQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveAB";
 set xlabel "X1 [m]";
 set xrange [ 0.00000e+000 :  2.00000e-001];
 set ylabel "X2 [m]";
 set yrange [-1.00000e-001 :  1.00000e-001];
 plot '.\FIGURES\curveAB.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveABQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveAB";
 set xlabel "X1 [m]";
 set xrange [ 0.00000e+000 :  2.00000e-001];
 set ylabel "X3 [m]";
 set yrange [-1.00000e-001 :  1.00000e-001];
 plot '.\FIGURES\curveAB.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveABQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveAB";
 set xlabel "X2 [m]";
 set xrange [-1.00000e-001 :  1.00000e-001];
 set ylabel "X3 [m]";
 set yrange [-1.00000e-001 :  1.00000e-001];
 plot '.\FIGURES\curveAB.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveCDQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveCD";
 set xlabel "X1 [m]";
 set xrange [ 4.40000e+000 :  1.71000e+001];
 set ylabel "X2 [m]";
 set yrange [-6.35000e+000 :  6.35000e+000];
 plot '.\FIGURES\curveCD.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveCDQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveCD";
 set xlabel "X1 [m]";
 set xrange [ 4.40000e+000 :  1.71000e+001];
 set ylabel "X3 [m]";
 set yrange [-2.53600e+000 :  1.01640e+001];
 plot '.\FIGURES\curveCD.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveCDQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveCD";
 set xlabel "X2 [m]";
 set xrange [-6.35000e+000 :  6.35000e+000];
 set ylabel "X3 [m]";
 set yrange [-2.53600e+000 :  1.01640e+001];
 plot '.\FIGURES\curveCD.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveGHQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveGH";
 set xlabel "X1 [m]";
 set xrange [ 4.40000e+000 :  1.71000e+001];
 set ylabel "X2 [m]";
 set yrange [-6.35000e+000 :  6.35000e+000];
 plot '.\FIGURES\curveGH.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveGHQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveGH";
 set xlabel "X1 [m]";
 set xrange [ 4.40000e+000 :  1.71000e+001];
 set ylabel "X3 [m]";
 set yrange [-1.01640e+001 :  2.53600e+000];
 plot '.\FIGURES\curveGH.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveGHQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveGH";
 set xlabel "X2 [m]";
 set xrange [-6.35000e+000 :  6.35000e+000];
 set ylabel "X3 [m]";
 set yrange [-1.01640e+001 :  2.53600e+000];
 plot '.\FIGURES\curveGH.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveEFQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveEF";
 set xlabel "X1 [m]";
 set xrange [ 2.25000e+001 :  9.19000e+001];
 set ylabel "X2 [m]";
 set yrange [-3.47000e+001 :  3.47000e+001];
 plot '.\FIGURES\curveEF.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveEFQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveEF";
 set xlabel "X1 [m]";
 set xrange [ 2.25000e+001 :  9.19000e+001];
 set ylabel "X3 [m]";
 set yrange [-3.47000e+001 :  3.47000e+001];
 plot '.\FIGURES\curveEF.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveEFQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveEF";
 set xlabel "X2 [m]";
 set xrange [-3.47000e+001 :  3.47000e+001];
 set ylabel "X3 [m]";
 set yrange [-3.47000e+001 :  3.47000e+001];
 plot '.\FIGURES\curveEF.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [CurveSquare]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\CurveSquareQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "CurveSquare";
 set xlabel "X1 [m]";
 set xrange [-5.00000e-001 :  5.00000e-001];
 set ylabel "X2 [m]";
 set yrange [-5.00000e-001 :  5.00000e-001];
 plot '.\FIGURES\CurveSquare.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [CurveSquare]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\CurveSquareQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "CurveSquare";
 set xlabel "X1 [m]";
 set xrange [-5.00000e-001 :  5.00000e-001];
 set ylabel "X3 [m]";
 set yrange [-5.00000e-001 :  5.00000e-001];
 plot '.\FIGURES\CurveSquare.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [CurveSquare]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\CurveSquareQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "CurveSquare";
 set xlabel "X2 [m]";
 set xrange [-5.00000e-001 :  5.00000e-001];
 set ylabel "X3 [m]";
 set yrange [-5.00000e-001 :  5.00000e-001];
 plot '.\FIGURES\CurveSquare.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propABQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propABQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propABQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propABQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propABQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propABQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propABQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propABQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propABQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propABQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propABQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propABQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propABQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propABQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propABQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propABQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propABQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propABQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propABQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propAB]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propABQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propAB";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propABQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveBCQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveBC";
 set xlabel "X1 [m]";
 set xrange [ 2.00000e-001 :  4.40000e+000];
 set ylabel "X2 [m]";
 set yrange [-2.10000e+000 :  2.10000e+000];
 plot '.\FIGURES\curveBC.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveBCQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveBC";
 set xlabel "X1 [m]";
 set xrange [ 2.00000e-001 :  4.40000e+000];
 set ylabel "X3 [m]";
 set yrange [-1.93000e-001 :  4.00700e+000];
 plot '.\FIGURES\curveBC.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveBCQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveBC";
 set xlabel "X2 [m]";
 set xrange [-2.10000e+000 :  2.10000e+000];
 set ylabel "X3 [m]";
 set yrange [-1.93000e-001 :  4.00700e+000];
 plot '.\FIGURES\curveBC.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propBCQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propBCQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propBCQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propBCQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propBCQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propBCQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propBCQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propBCQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propBCQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propBCQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propBCQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propBCQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBCQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBCQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBCQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBCQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBCQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBCQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBCQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBC]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBCQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBC";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propBCQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveBGQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveBG";
 set xlabel "X1 [m]";
 set xrange [ 2.00000e-001 :  4.40000e+000];
 set ylabel "X2 [m]";
 set yrange [-2.10000e+000 :  2.10000e+000];
 plot '.\FIGURES\curveBG.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveBGQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveBG";
 set xlabel "X1 [m]";
 set xrange [ 2.00000e-001 :  4.40000e+000];
 set ylabel "X3 [m]";
 set yrange [-4.00700e+000 :  1.93000e-001];
 plot '.\FIGURES\curveBG.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveBGQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveBG";
 set xlabel "X2 [m]";
 set xrange [-2.10000e+000 :  2.10000e+000];
 set ylabel "X3 [m]";
 set yrange [-4.00700e+000 :  1.93000e-001];
 plot '.\FIGURES\curveBG.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propBGQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propBGQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propBGQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propBGQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propBGQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propBGQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propBGQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propBGQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propBGQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propBGQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propBGQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propBGQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBGQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBGQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBGQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propBGQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBGQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBGQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propBGQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propBG]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propBGQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propBG";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propBGQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propCDQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propCDQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propCDQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propCDQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propCDQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propCDQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propCDQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propCDQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propCDQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propCDQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propCDQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propCDQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propCDQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propCDQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propCDQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propCDQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propCDQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propCDQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propCDQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propCD]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propCDQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propCD";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propCDQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propGHQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propGHQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propGHQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propGHQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propGHQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propGHQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propGHQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propGHQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propGHQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propGHQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propGHQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propGHQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propGHQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propGHQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propGHQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propGHQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propGHQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propGHQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propGHQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propGH]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propGHQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propGH";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propGHQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveDEQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveDE";
 set xlabel "X1 [m]";
 set xrange [ 1.71000e+001 :  2.25000e+001];
 set ylabel "X2 [m]";
 set yrange [-2.70000e+000 :  2.70000e+000];
 plot '.\FIGURES\curveDE.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveDEQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveDE";
 set xlabel "X1 [m]";
 set xrange [ 1.71000e+001 :  2.25000e+001];
 set ylabel "X3 [m]";
 set yrange [-7.93000e-001 :  4.60700e+000];
 plot '.\FIGURES\curveDE.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveDEQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveDE";
 set xlabel "X2 [m]";
 set xrange [-2.70000e+000 :  2.70000e+000];
 set ylabel "X3 [m]";
 set yrange [-7.93000e-001 :  4.60700e+000];
 plot '.\FIGURES\curveDE.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propDEQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propDEQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propDEQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propDEQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propDEQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propDEQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propDEQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propDEQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propDEQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propDEQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propDEQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propDEQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propDEQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propDEQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propDEQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propDEQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propDEQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propDEQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propDEQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propDE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propDEQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propDE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propDEQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveHEQcv1Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveHE";
 set xlabel "X1 [m]";
 set xrange [ 1.71000e+001 :  2.25000e+001];
 set ylabel "X2 [m]";
 set yrange [-2.70000e+000 :  2.70000e+000];
 plot '.\FIGURES\curveHE.mdt' using 1:2 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveHEQcv2Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveHE";
 set xlabel "X1 [m]";
 set xrange [ 1.71000e+001 :  2.25000e+001];
 set ylabel "X3 [m]";
 set yrange [-4.60700e+000 :  7.93000e-001];
 plot '.\FIGURES\curveHE.mdt' using 1:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [curveHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 1;
 set output '.\FIGURES\curveHEQcv3Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "curveHE";
 set xlabel "X2 [m]";
 set xrange [-2.70000e+000 :  2.70000e+000];
 set ylabel "X3 [m]";
 set yrange [-4.60700e+000 :  7.93000e-001];
 plot '.\FIGURES\curveHE.mdt' using 2:3 title "Curve" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propHEQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propHEQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propHEQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propHEQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propHEQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propHEQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propHEQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propHEQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propHEQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propHEQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propHEQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propHEQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propHEQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propHEQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propHEQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propHEQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propHEQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propHEQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propHEQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propHE]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propHEQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propHE";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propHEQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQm00Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN M00 [kg/m]";
 set autoscale y;
 plot '.\FIGURES\propEFQm00Q.mdt' using 1:2 title "m00" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQm02Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM2 [kg]";
 set autoscale y;
 plot '.\FIGURES\propEFQm02Q.mdt' using 1:2 title "m02" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQm03Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MASS/SPAN . XM3 [kg]";
 set autoscale y;
 plot '.\FIGURES\propEFQm03Q.mdt' using 1:2 title "m03" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQm33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M33 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propEFQm33Q.mdt' using 1:2 title "m33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQm23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M23 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propEFQm23Q.mdt' using 1:2 title "m23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQm22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "MOMENT OF INERTIA/SPAN M22 [kg.m^2/m]";
 set autoscale y;
 plot '.\FIGURES\propEFQm22Q.mdt' using 1:2 title "m22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk11Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K11 [N]";
 set autoscale y;
 plot '.\FIGURES\propEFQk11Q.mdt' using 1:2 title "k11" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk12Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K12 [N]";
 set autoscale y;
 plot '.\FIGURES\propEFQk12Q.mdt' using 1:2 title "k12" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk22Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K22 [N]";
 set autoscale y;
 plot '.\FIGURES\propEFQk22Q.mdt' using 1:2 title "k22" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk13Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K13 [N]";
 set autoscale y;
 plot '.\FIGURES\propEFQk13Q.mdt' using 1:2 title "k13" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk23Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K23 [N]";
 set autoscale y;
 plot '.\FIGURES\propEFQk23Q.mdt' using 1:2 title "k23" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk33Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K33 [N]";
 set autoscale y;
 plot '.\FIGURES\propEFQk33Q.mdt' using 1:2 title "k33" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk14Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K14 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk14Q.mdt' using 1:2 title "k14" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk24Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K24 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk24Q.mdt' using 1:2 title "k24" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk34Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K34 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk34Q.mdt' using 1:2 title "k34" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk44Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K44 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propEFQk44Q.mdt' using 1:2 title "k44" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk15Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K15 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk15Q.mdt' using 1:2 title "k15" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk25Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K25 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk25Q.mdt' using 1:2 title "k25" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk35Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K35 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk35Q.mdt' using 1:2 title "k35" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk45Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K45 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propEFQk45Q.mdt' using 1:2 title "k45" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk55Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K55 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propEFQk55Q.mdt' using 1:2 title "k55" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk16Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K16 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk16Q.mdt' using 1:2 title "k16" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk26Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K26 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk26Q.mdt' using 1:2 title "k26" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk36Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K36 [N.m]";
 set autoscale y;
 plot '.\FIGURES\propEFQk36Q.mdt' using 1:2 title "k36" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk46Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K46 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propEFQk46Q.mdt' using 1:2 title "k46" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk56Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K56 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propEFQk56Q.mdt' using 1:2 title "k56" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQk66Q.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "STIFFNESS COEFFICIENT K66 [N.m^2]";
 set autoscale y;
 plot '.\FIGURES\propEFQk66Q.mdt' using 1:2 title "k66" with lines linestyle 1 ;
 set nomultiplot;
 set output;

 ############
 # Title: [propEF]
 ############
 reset
 set terminal postscript portrait enhanced color "Times New Roman" 18;
 set size ratio 0.75;
 set output '.\FIGURES\propEFQmucQ.eps';
 set key; set border; set grid; set nomultiplot;
 set style line  1 lt  1 lw 3.0 pt  1 ps 1.5;
 set title "propEF";
 set xlabel "ETA";
 set autoscale x;
 set ylabel "DAMPING COEFFICIENT [1/sec]";
 set autoscale y;
 plot '.\FIGURES\propEFQmucQ.mdt' using 1:2 title "muc" with lines linestyle 1 ;
 set nomultiplot;
 set output;