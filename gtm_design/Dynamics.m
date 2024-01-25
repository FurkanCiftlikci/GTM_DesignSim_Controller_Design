function [TableLongitudinal, TableLateral1, TableLateral2] = Dynamics(londynA,latdynA)

EigenValueLongitudinal = eig(londynA);

EigenValueLateral = eig(latdynA);

ShortPeriodMoodRoot = [EigenValueLongitudinal(1),[EigenValueLongitudinal(2)]];
PhugoidMoodRoot = [EigenValueLongitudinal(3),EigenValueLongitudinal(4)];
DutchRollMoodRoot = [EigenValueLateral(1),EigenValueLateral(2)];
RolMoodlRoot = [EigenValueLateral(3)];
SpriralMoodRoot = [EigenValueLateral(4)];


ShortPeriodMoodNaturalFrequencs = sqrt(EigenValueLongitudinal(1)*EigenValueLongitudinal(2));
ShortPeriodMoodDampingRatio = -(EigenValueLongitudinal(1)+EigenValueLongitudinal(2))/(2*ShortPeriodMoodNaturalFrequencs);
ShortPeriodMoodPeriod = (2*pi)/ShortPeriodMoodNaturalFrequencs;

PhugoidMoodNaturalFrequencs = sqrt(EigenValueLongitudinal(3)*EigenValueLongitudinal(4));
PhugoidMoodDampingRatio = -(EigenValueLongitudinal(3)+EigenValueLongitudinal(4))/(2*PhugoidMoodNaturalFrequencs);
PhugoidMoodPeriod = (2*pi)/PhugoidMoodNaturalFrequencs;



Mood = {'Short Period';'Phugoid'};
RootLocation = [ShortPeriodMoodRoot;PhugoidMoodRoot];
NaturalFrequency = [ShortPeriodMoodNaturalFrequencs;PhugoidMoodNaturalFrequencs];
DampingRatio = [ShortPeriodMoodDampingRatio;PhugoidMoodDampingRatio];
Period = [ShortPeriodMoodPeriod;PhugoidMoodPeriod];

TableLongitudinal = table(Mood,RootLocation,NaturalFrequency,DampingRatio,Period);


DutchRollMoodNaturalFrequencs = sqrt(EigenValueLateral(1)*EigenValueLateral(2));
DutchRollMoodDampingRatio = -(EigenValueLateral(1)+EigenValueLateral(2))/(2*DutchRollMoodNaturalFrequencs);
DutchRollMoodPeriod = (2*pi)/DutchRollMoodNaturalFrequencs;

Mood = {'DutchRoll'};
RootLocation = [DutchRollMoodRoot];
NaturalFrequency = [DutchRollMoodNaturalFrequencs];
DampingRatio = [DutchRollMoodDampingRatio];
Period = [DutchRollMoodPeriod];

TableLateral1 = table(Mood,RootLocation,NaturalFrequency,DampingRatio,Period);

RolMoodlTimeConstant = [abs(1/RolMoodlRoot)];
SpriralMoodTimeConstant = [abs(1/SpriralMoodRoot)];

Mood = {'Rool';'Spiral'};
RootLocation = [RolMoodlRoot;SpriralMoodRoot];
TimeConstant = [RolMoodlTimeConstant;SpriralMoodTimeConstant];


TableLateral2 = table(Mood,RootLocation,TimeConstant);

end


