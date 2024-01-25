A = [-0.085,4.603,0,-9.798;
     -0.012,-2.131,0.98,-0.011;
      0.009,-26.397,-2.955,0.008;
       0,0,1,0];

EigenValueLongitudinal = eig(A);

ShortPeriodRoot = [EigenValueLongitudinal(1),[EigenValueLongitudinal(2)]]
PhugoidRoot = [EigenValueLongitudinal(3),EigenValueLongitudinal(4)];

ShortPeriodNaturalFrequencs = sqrt(EigenValueLongitudinal(1)*EigenValueLongitudinal(2));
ShortPeriodDampingRatio = -(EigenValueLongitudinal(1)+EigenValueLongitudinal(2))/(2*ShortPeriodNaturalFrequencs);
ShortPeriodMoodPeriod = (2*pi)/ShortPeriodNaturalFrequencs;

PhugoidNaturalFrequencs = sqrt(EigenValueLongitudinal(3)*EigenValueLongitudinal(4));
PhugoidDampingRatio = -(EigenValueLongitudinal(3)+EigenValueLongitudinal(4))/(2*PhugoidNaturalFrequencs);
PhugoidMoodPeriod = (2*pi)/PhugoidNaturalFrequencs;

Mood = {'Short Period';'Phugoid'};
RootLocation = [ShortPeriodRoot;PhugoidRoot];
NaturalFrequency = [ShortPeriodNaturalFrequencs;PhugoidNaturalFrequencs];
DampingRatio = [ShortPeriodDampingRatio;PhugoidDampingRatio];
Period = [ShortPeriodMoodPeriod;PhugoidMoodPeriod];

TableLongitudinal = table(Mood,RootLocation,NaturalFrequency,DampingRatio,Period)


