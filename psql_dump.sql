SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: consultation_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultation_requests (
    id bigint NOT NULL,
    patient_id bigint NOT NULL,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.consultation_requests OWNER TO postgres;

--
-- Name: consultation_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consultation_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consultation_requests_id_seq OWNER TO postgres;

--
-- Name: consultation_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultation_requests_id_seq OWNED BY public.consultation_requests.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    id bigint NOT NULL,
    first_name character varying,
    middle_name character varying,
    last_name character varying,
    birth_date date,
    telephone_number character varying,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO postgres;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendations (
    id bigint NOT NULL,
    consultation_request_id bigint NOT NULL,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recommendations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recommendations_id_seq OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recommendations_id_seq OWNED BY public.recommendations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: consultation_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_requests ALTER COLUMN id SET DEFAULT nextval('public.consultation_requests_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Name: recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations ALTER COLUMN id SET DEFAULT nextval('public.recommendations_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-10-03 19:53:14.962868	2023-10-03 19:53:14.962868
\.


--
-- Data for Name: consultation_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultation_requests (id, patient_id, content, created_at, updated_at) FROM stdin;
1	1	qwerty	2023-10-04 06:02:00.835103	2023-10-04 06:02:00.835103
2	3	qwerty	2023-10-04 06:02:06.360245	2023-10-04 06:02:06.360245
3	1	qwerty	2023-10-04 06:02:18.221926	2023-10-04 06:02:18.221926
4	3	test recommendation	2023-10-04 06:49:43.948889	2023-10-04 06:49:43.948889
5	2	голова болит	2023-10-04 07:35:42.429096	2023-10-04 07:35:42.429096
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (id, first_name, middle_name, last_name, birth_date, telephone_number, email, created_at, updated_at) FROM stdin;
1				\N			2023-10-03 20:16:36.313743	2023-10-03 20:16:36.313743
2	roman			2005-08-09		@gmia;.c	2023-10-03 20:24:48.992217	2023-10-03 20:24:48.992217
3	тест	тест	тест	2005-08-09	+375447534067	тест@gmail.com	2023-10-04 05:49:08.156034	2023-10-04 05:49:08.156034
\.


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommendations (id, consultation_request_id, content, created_at, updated_at) FROM stdin;
1	4	{"content"=>"test recommendation"}	2023-10-04 06:56:32.321987	2023-10-04 06:56:32.321987
2	1	test recommendation2	2023-10-04 06:57:21.595004	2023-10-04 06:57:21.595004
3	2	test recommendation3	2023-10-04 06:57:28.818278	2023-10-04 06:57:28.818278
4	5	попей таблетки	2023-10-04 07:55:42.366683	2023-10-04 07:55:42.366683
5	5	попей таблетки	2023-10-04 07:56:07.908257	2023-10-04 07:56:07.908257
6	5	попей таблетки	2023-10-04 07:57:27.638493	2023-10-04 07:57:27.638493
7	5	попей таблетки	2023-10-04 07:59:38.492515	2023-10-04 07:59:38.492515
8	5	попей таблетки	2023-10-04 08:12:01.259319	2023-10-04 08:12:01.259319
9	5	AgeBMITempHeartRateSBPDBPEdemaRosElevatedSystolicBpElevatedDiastolicBpVeryElevatedSystolicBpVeryElevatedDiastolicBpRRO2SatsFio2WeightLossWeightGainChillsHistoryFeverGeneralizedFatigueDecreasedMoodAmbulationNHLongTermResidencyFastingRecentHospitalStayContactsArrestHypoTensionIndwellingCathetersMalariaTravelNewDetergentsNewFoodsGoutFoodsVisualAcuityRosBlindnessRosDoubleVisionRosYellowScleraeRosEyesItchySneezingLossOfSmellLossOfTastePostNasalDrainageRunnyNoseCongestionEasyBleedingFromGumsSinusesPainRosSeasonalNotSoSeasonalHoarsenessAngioedemaLarynxPainSoreThroatROSTrismusAphtousUlcersGlossitisOnROSPainBehindJawAngleEarPainRosDryMucusMembranesDryEyesHearingLossRosEarDCRosOrthopneaHxParoxysmalNDHxChestPainAnginaYesNoChestPainSeverityChestPainAginaStabilitySeverityChestPainAginaStabilityFrequencyChestPainAginaStabilityLastChestPainQualityChestPainLastsChestPainRadiationChestPainAginaLocalizedChestPainReproducibleByPalpationChestPainAssociatedWithCoughChestPainAginaNitroChestPainAginaAntacidChestPainAginaRestArrhythmiaArrhythmiaSymptomsLightheadednessArrhythmiaSymptomsChestPainsArrhythmiaSymptomsWeaknessArrhythmiaSymptomsHeadachesArrhythmiaSymptomsSweatsDVTSxDyspneaSeveritySubjectiveDyspneaProgressionSubjectiveDyspneaAnxietyDyspneaTinglingDyspneaLightheadednessDyspneaBagMucousProductionMucousProductionIncMucusFeaturesMucousCharacterSeverityCoughWheezingHWheezingEpisodicHemoptysisTimingChestPainPleuriticPulmChestPainProgressionPulmSnoringDayTimeSleepinessSkinMoistureHxEasyBruisingSkinSweatingHxJaundiceHxHyperpigmentationSkinHxHirsutismHxSkinErythemamaculesRashHxSkinErythemaNodosumSkinErythemapapulesRashHxSkinErythemapustulesRashHxSkinPetechiaeRashHxSkinUrticariaRashHxSkinFlushesSkinHerpesRashHxSkinItchinessHxPerineumItchinessHxPerianalItchinessHxFingersClubbingBreastGynecomastiaErythemaSpiderAngiomaNauseaVomitingDryRetchingHeartBurnUpperGIBleedSxLowerGIBleedSxDiarrheaSxFattyStoolChronicDiarrheaSxConstipationStoolStoolEvacVagueAbdSxAbdDiscomfortExacerbatedByStressAbdCrampsFlatulenceAbdSxStomachPainSeveritySxStomachPainDistributionSxStomachPainResolvesPRDXSxPeriAnalPainSxPeriAnalSoilingSxStomachPainProgressionSubjectiveStomachPainLengthStomachPainDurationRUQPainLUQPainRLQPainLLQPainRLFlankPainStomachPainPeriumbilicalAreaStomachPainEpigastricAreaRLInguinalPainBellowTheUmbAbdPainStomachPainPeriodAbdPainRadBackAbdPainImprovesLeaningAbdPainRadPerineumBackPainRadPerineumFastingPainEtohAbdPainEatingPainLayingdownPainStrainingPainFoodIntakeMalnutritionEarlySatietyFluidIntakeFluidNoLytesIntakeSwallowPainSolidsSwallowFluidsSwallowChokingSwallowRegurgFoodFecalUrgencyUrineSoilingSxBurningWithUrinationUrinaryFrequencyGrossHematuriaDarkUrineFoamyUrineMicroscopicHematuriaRBCsUAProteinuriaMicroscopicHematuriaOccultNocturiaUrinationRelievesWeakStreamStrainStreamUrinaryUrgencyLessUrineOliguriaPolyuriaPolydipsiaStressIncoHxNonEmptyBladderUrgencyIncoHxConstantIncoHxFemaleSpottingSxFemaleVaginalDrynessMaleSpottingSxFemaleDCSxMaleDCSxVaginalSorenessSxVaginalItchingPusMaleSpottingSxScrotalPainSxHeavyPeriodsSxHematuriaAroundPeriodIrregularPeriodsSxLastPeriodDyspaureniaSxMaleProstatePainSxHxChildbirthAnyLocalNeuroFindingsRestlessLegsSymptomsROSLocalizedSensoryDeficitHxLocalizedNeuroMotoLEHxLocalizedNeuroSensUEHxLocalizedNeuroSensLEHxLocalizedNeuroMotoUEHxGeneralizedWeaknessAMSDecreasedLongTermMemoryDecreasedLongTermMemoryOnExamDecreasedShortTermMemoryOnExamDecreasedShortTermMemorySeizureAphasiaHxAphasiaHxSensoryLossOfConsciousnessLossOfConsciousnessProdromeLossOfConsciousnessProdromePalpitationsLossOfConsciousnessProdromeChestPainLossOfConsciousnessHeadacheLossOfConsciousnessSeizuresLossOfConsciousnessSphincterLossOfConsciousnessPostictallOrthostaticLightheadednessDizzinessWithPositionDizzinessWithExertionHeadacheFrontalHeadacheAssociatedWithHTNHeadacheAssociatedWithStressHeadacheAssociatedWithDecreasedCaffeineIntakeHeadacheThunderclapHeadacheTemporalHeadacheOtherHeadacheIntensityPhotophobiaPhonophobiaHeadachePulsatileHeadacheSqueezingTearingOfEyeHeadacheTimingHeadacheAssociatedWithNauseaHeadacheAssociatedWithPhysicalActivityHeatIntoleranceColdIntoleranceSaltCravingPicaHallucinationsROSNeckStiffnLowbackPainLowbackSeverityLowbackPainFlexionLowbackPainTrigLowbackPainSleepLowbackPainExerciseBoneLocPainJointsPainBoneGenPainMuscleGenPainGoutyRosPainGoutyRosPainProgressionSpinePainRestingPainInLowerExtremitiesTraumaToToesWithNoSkinBrakeHeightDecreasedPMHXChestTraumaPMHXMarfanSyndromPMHXHeadTraumaPMHXCOPDPMHXAsthmaPMHXAtopicDermatitisPMHXBPInfPMHXRiskFxDVTPMHXSpontanousAbortionPMHXofDVTorPEPMHXofSVTPMHXCHFPMHXCADPMHXOfThoracicAorticAneurysmOrDissectionPMHXPVDPMHXCVAPMHXICHThyroidBruitPMHXAFibPMHXHTNResistantHypertensionEarlyOnsetOfHypertensionAbruptOnsetOfHypertensionLateOnsetOfHypertensionPMHXDM1PMHXDM2PMHXHyperlipidemiaPMHXPCDMPMHXKidneyStonePMHXPUDPMHXERCPPMHXAbdominalSurgeryPMHXBowelObstructionPMHXRecentAngiographyPMHXVeneralPMHXHIVPMHXHypoPMHXCKDPMHXGoutPMHXBPHPMHXBladderCancerPMHXProstateCancerPMHXOvarianCPMHXChronsPMHXCUPMHXPancreatitisPMHXColonPolypPMHXAbdominalRadiationPMHXAbdominalHerniaPMHXAtypicalDuctalorLobularHyperplasiaOrLobularCarcinomaOnPriorBreastBiopsyPMHXBRCA12positivityAgeAtMenarcheAgeAtMenopauseAgeAtFirstBirthPMHXGEPMHXLiverCirrhosisPMHXVaricesPMHXPeritionitisPMHXVGallStonesPMHXDiverticulosisDiverticulitisPMHXDiverticulosisDiverticulosisPMHXColonCancerPMHXDepressionPMHXSubstanceAbusePMHXPsychOtherThanDepresionPMHXAspirationPMHXPneumoniaPMHXURTIPMHXTonsillectomyPMHXDentalWorkPMHXIDPMHXAutoimmunePMHXMalNeoPMHXContactHospitalPMHXContactDialysisPMHXContactWoundCarePMHXContactNursingHomePMHXWoundCurrentPMHXDialysisCurrentPMHXHepatitisCPMHXHepatitisBAnticoagCurrentUseOfHormonalReplacementTherapyBronchoDilatorsDiureticsDiureticsRecentlyStartedOrIncreasedPatientOnDiureticsDiureticsOvertAllergicToDyeWoundCareRecentPoAbxMedOpiatesMedIVAbxMedACEARBACEARBUseCausedAzotemiaNSAIDSMedContrastIodineTCAMedAntiCholinergicMedSerotoninergicMedBZDMedLithiumMedThisSeasonsFluVaccineGivenCovidVaccineTakenAllergyMedsNeutropeniaMedsPancreatitisMedsNitratesMedsNitratesMedsRelatedToHeadachesMedsRecentChemotherapyHistoryOfChestRadiationFHCOPDFHAsthmaFHAtopicDermatitisFHCADFHHTNFHDMFHDVTPEParentFHIBDCDFHIBDCUFHMEN2FHProstateCaFHBreastCancerFHVHLFHNF1FHEarlyCCExposurePneumonitisExposureBladderCancerSmokerETOHRecentIVDrugsRecentCocaineUseDustExposureTBExposureSexExposureSexActivePregnancyPossibleUrinePregnancyTestExposureToCovidGenderRaceAnisocoriaPupilsPupilsReactionConjunctivasConjunctivasPaleExophtalmosAcuityBlindnessNoseCongestionSinusesTenderThroatExamDentalHygieneDryMMExamGlossitisOnExamHistoryOfHavingWetEarHistoryOfEarTraumaPriorToPainOtoscopicSerousOtoscopicPusDischargeFromEarMeatusTenderMeatusEdematousMeatusErythematousOtoscopicErythemaOtoscopicBuldingNeckStiffnessNeckSwollenThyroidEnlargedThyroidNodulesAnteriorCervicalNodesExamRalesRhonchiWheezingDecreasedBreathSoundsAccessoryMusclesProlongedExpPhaseRhythmRegularJVDOrthopneaExamEarlySystolicHolosystolicMurmurAtApexMREarlySystolicHolosystolicMurmurAtApexRadiationMREarlySystolicHolosystolicMurmurLeftSternalBorderTREarlySystolicHolosystolicMurmurLeftSternalBorderRadiationTREarlySystolicHolosystolicMurmurAtTheLeftLowerSternalBorderVSDEarlySystolicHolosystolicMurmurAtTheLeftLowerSternalRadiationVSDMidSystolicEjectionMurmurAtTheRightSternalBorderASMidSystolicEjectionMurmurAtTheRightSternalBorderRadiationASEarlyDiastolicMurmurAREarlyDiastolicMurmurRadiationARGrahamSteellPDAMPericardialFrictionRS3ToneRS4ToneLS3ToneLS4ToneAsymmetricEdemaLEEdemaTenderLEDVTSgLegsWarmLegsRedDistalPulsesLEColdLowerLimbTipsClaudicationLowerExtremitiesColdUpperLimbTipsFemoralPulsesBloodPressureDifferenceBloodPressureDifferenceLRPulseStrenghtDifferenceLRCarotidBruitsRenalBruitsEpigastricTenderLowerMidAbdTenderPeriumbilicaAbdTenderRUQTenderLUQTenderRLLQTenderReboundTendernessAbdGuardingAbdAscitesCaputMedusaeMurphysSignBowelSoundsPsoasSignRovsingSignCullenSignMalnutritionByExamGreyTurnersignBladderFullBladderEmptyRLInguinalAreaTenderRLInguinalAreaCoughBulgeInguinalLymphadenopathyAxillaryLymphadenopathyRectalExamHemorrhoidsRectalExamRectalCancerRectalExamFissureRectalExamBloodHepatomegalyExSplenomegalyExIrregularLiverExTestisTenderPETestisEnlargedTestisIrregularGoldflamsSignRectalExamProstateTEnderRectalExamProstateEnlargedRectalExamProstateHardenedRectalExamProstateIrregularPresenceOfPunctateHaemorrhagesOnVaginalExamPresenceOfThinAndDryMucosaPresenceOfVulvarInflamationCyanosisSubcutaneousFatNecrosisPanniculitisSignsOfInfectionAtExitSitesOfCathetersSkinMoistureExamJaundiceSkinPetechiaeRashExamSkinExfoliativeRashExamSkinIschemicChangesSkinUrticariaRashExamCondylomataExamSkinHerpesRashExamSkinErythemamaculesRasExamSkinErythemaNodosumExamSkinErythemapapulesRashExamSkinErythemapustulesRashExamSkinFlushingExamAtaxiaLEAtaxiaUEMyoclonusDysarthriaTremorPickingObjectsMuscleRigidityLocalizedNeuroSensLEExLocalizedNeuroMotoLEExLocalizedNeuroSensUEExLocalizedNeuroMotoUEExLocalizedSensoryDeficitExLocalizedMotorDeficitExGeneralizedWeaknessExamAphasiaExamMeningealSignsRombergsSignBabinskiSignFeetClonusGeneralHyperreflexiaStraightLegRaiseCrossedStraightLegRaiseWeakAnkleWeakKneeNystagmusEyeMovementsGoutyExamTendernessGoutyExamWarmthGoutyExamEdemaLumbarLordosisParaspinalMusclesLimitedSpineTspineTenderExLspineTenderExSspineTenderExHallucinationsOnExamCspineTenderExMSVerbalContactMSOrientationMSFullyAwakensMSDrowsinessMSStimulusAwakensMSAgitatedHGBlevelDropInHGBlevelWithinLast24HoursMCVlevelWBClevelLymphocyteLevelSerumCreatinineSerumCreatinineAtBaselineBaselineeGFRPlateletsLevelINRTSATFerritinLabFolateLabB12 LabMMALevelHomocysteineLevelIntrinsicFactorLabantiPLA2RabantiGBMantiTHSD7AabHepatitisCAntibodiesTotalIgGAndIgMAlbuminlevelCRPlevelESRlevelAldoReninTSHFeatureAldosteronePotassiumDDimerTroponinIPCTLDHHaptoglobinLabUricAcidLevelASTALTAmylaseLipaseTotalBilirubinAlkalinePhosphataseSerumCKBNPPSABicarbCalciumTriglyceridesLevelCholesterolLevelLacticAcidAnionGapBetaHydroxyButyrateHba1cGAD65InsulinAATyrosinePhosphatasesIsletCellAAZincTransporterZNT8FastingGlucoseTwoHrPlasmaGlucoseDuringOGTTRandomBloodGlucoseProteinuriaAlbuminuriaFeaturesOfHematuriaOnUASerumbHCGPelvicUSForEctopicPregnancyPelvicUSForNlPregnancygFOBTpCO2onABGpHonABGpHofVaginalDcHypercapniaOnAbgFeaturesOfInflamationOnUAGramStainUrineGonococcusWetMountResultsWhiffTestResultsBuddingYeastMyceliaAfterKOHRightVentricleStrainOnEchoDecreasedEFonECHOSegmentalDyskinesiaHypokinesiaAkinesiaECHOAorticDissectionTEEStressECGCADStressEchoCADStressNukeOSAOnSleepStudyFEV1toFVCRatioFEV1toFVCRatioImprovingBy12BeforeAndAfterBronchodilatorCxrayFocalInfiltrateCxrayPTXChestCTPTXXrayDoubleBariumEnemaForColonCaHydroOnCTGroundGlassOnChestCtIntersitialAbnormalitiesOnChestCtLocalPatchyInfiltratesOnChestCtDiverticulitisOnCtAppendicitsOnUSAppendicitsOnCTRenalArteriesDigitalSubstractionAngiographyRenalArteriesMagneticResonanceAngiographyWithGadolinumRenalArteriesMagneticResonanceAngiographyWithoutGadolinumRenalArteriesCTAngiographyWithIVDyeThoracicAortaCTAngiographyWithIVDyePEonCTAngioPEonVQScanRVStrainOnCTAngioBiliaryColicOnCtBiliaryCollicOnUSBiliaryCollicOnEUSPeriNephricStrandingOnCTLBOOnAbdominalPlainRadiographLBOonCTwDyeLBOonCTSBOOnAbdominalPlainRadiographPneumoperitoneumAbdXrayPneumoperitoneumChestXrayPneumoperitoneumChestCTPneumoperitoneumAbdCTSBOonCTwDyeSBOonCTSBOOnBedsideUltrasoundIschemicColitisOnUltrasoundAMIOnAbdominalPlainRadiographAMIODigitalSubstractionAngiographyAMIonCTAngioAMIonCTIschemicColitisXrayBariumEnemaForLBONephrolithiasisOnCTNephrolithiasisOnUSUreterolithiasisOnCTUreterolithiasisOnUSColonMalignancyOnCTColonographyDenseBreastTissueOnMammographyHydroOnUSRenalArterieDuplexUltrasonographyRenalAsymmetryOnUSUSProstateEnlargedElevatedPVRThickenedBladderWallBladderMalignancyOnUSJugularVeinFacialVeinsThrombosisArterialLowerExtremitiesDopplersFirstExtremitiesDopplersToRuleOutDVTSecondExtremitiesDopplersToRuleOutDVTExtremitiesDopplersToRuleOutSVTJugularVeinFacialVeinsThrombosisonCTCxrayPleuralEffusionCxrayWidenedMediastinumCxrayBlInfilEdemaCxrayBilInfiltratesBrainCTNonContrastForSAHCranialCTNonContrastForChronicSinusitisCranialCTNonContrastForAcuteSinusitisParanasalSinusesTargetedXrayForSinusitisBrainCTNormalBrainMRINormalBrainMRIWithGadNormalBrainCTContrastNormalBrainCTNonContrastForICHBrainCTNonContrastForIschemicCVABrainMRIForIschemicCVAMembranousNephropathyOnBiopsyGoodpastureSyndromeonKidneyBiopsyNephriticSyndromeonKidneyBiopsyNephroticSyndromeonKidneyBiopsyMSUInSynovialFluidLumbarPunctionFluidForSAHTransrectalProstateBiopsyCirrhosisOnLiverBiopsyBreastBiopsyBRCA12GeneticTestingPCRCovidPCRGonococcusPCRChlamydiaPCRRNAHepCPCRFluHIV1HIV2ElisaResultsPCRHIVDNAHIVWesternBlotBloodCulturesx2CdiffStoolToxinStoolForOvasAndParasitesLegionellaUrinaryAntigenFeatureStreptococcusUrinaryAntigenFeatureThroatCultureStoolCultureThroatCultureForFusobacteriumNecrophorumBloodCultureForFusobacteriumNecrophorumRapiStrepTestDeviceBloodCulturesRapidFluAntigenTestingLactoseHydrogenTestUreaBreathTestStoolAntigenForHPyloriRapidUreaseTestEGDUConColonoscopyPathologyColonMalignancyOnColonoscopyEsophagitisOnEGDAnalFissureOnCScopeAnalFissureOnCSigmoidoscopyCrohnsOnColonoscopyCrohnsOnEGDCrohnsOnMRICrohnsOnCTGastritisOnEGDGallStonesInCysticDuctMRIMRCPAcuteCholecystitisConfirmationByUSAcuteCholecystitisConfirmationByHIDAGallStonesInPancreaticDuctCTGallStonesInPancreaticDuctMRIMRCPGallStonesInCommonBileDuctMRIMRCPGallStonesInGallBladerMRIMRCPGallStonesERCPGallStonesEUSPUDOnEGDBleedingPUDOnEGDBleedingEsophagealVaricesEsophagealVaricesOnEGDEsophagealVaricesOnCTCirrhosisOnCTUrogramCTUrineCytologyPollenAllergyTestingDustMitesAllergyTestingCystoscopyWithBiopsiesChronicPancreatitisOnAbdXrayChronicPancreatitisOnCtAcutePancreatitisOnAbdCTCirrhosisOnFibroScanCirrhosisOnMRICirrhosisOnUSProstateMalignancyBreastMalignancyElectrocardiogramIschemicChangesNSTEMIElectrocardiogramNonsepcificSTChangesElectrocardiogramIschemicChangesSTEMIElectiveCoronaryAngiogramCTCoronaryAngiogramCoronaryAngiogramRHCRvRHCLvCoronaryAngiogramAorticDissectionFoundElectrocardiogramHeartBlockElectrocardiogramPreExcitationElectrocardiogramHyperkalemiaElectrocardiogramHypokalemiaElectrocardiogramHypocalcemiaElectrocardiogramHypercalcemia	2023-10-04 08:22:35.807093	2023-10-04 08:22:35.807093
10	5	Age BMI Temp HeartRate SBP DBP EdemaRos ElevatedSystolicBp ElevatedDiastolicBp VeryElevatedSystolicBp VeryElevatedDiastolicBp RR O2Sats Fio2 WeightLoss WeightGain Chills HistoryFever GeneralizedFatigue DecreasedMood Ambulation NHLongTermResidency Fasting RecentHospitalStay Contacts Arrest HypoTension IndwellingCatheters MalariaTravel NewDetergents NewFoods GoutFoods VisualAcuityRos BlindnessRos DoubleVisionRos YellowScleraeRos EyesItchy Sneezing LossOfSmell LossOfTaste PostNasalDrainage RunnyNoseCongestion EasyBleedingFromGums SinusesPainRos Seasonal NotSoSeasonal Hoarseness Angioedema LarynxPain SoreThroatROS Trismus AphtousUlcers GlossitisOnROS PainBehindJawAngle EarPainRos DryMucusMembranes DryEyes HearingLossRos EarDCRos OrthopneaHx ParoxysmalNDHx ChestPainAnginaYesNo ChestPainSeverity ChestPainAginaStabilitySeverity ChestPainAginaStabilityFrequency ChestPainAginaStabilityLast ChestPainQuality ChestPainLasts ChestPainRadiation ChestPainAginaLocalized ChestPainReproducibleByPalpation ChestPainAssociatedWithCough ChestPainAginaNitro ChestPainAginaAntacid ChestPainAginaRest Arrhythmia ArrhythmiaSymptomsLightheadedness ArrhythmiaSymptomsChestPains ArrhythmiaSymptomsWeakness ArrhythmiaSymptomsHeadaches ArrhythmiaSymptomsSweats DVTSx DyspneaSeveritySubjective DyspneaProgressionSubjective DyspneaAnxiety DyspneaTingling DyspneaLightheadedness DyspneaBag MucousProduction MucousProductionInc MucusFeatures MucousCharacter SeverityCough WheezingH WheezingEpisodic HemoptysisTiming ChestPainPleuriticPulm ChestPainProgressionPulm Snoring DayTimeSleepiness SkinMoistureHx EasyBruising SkinSweatingHx JaundiceHx HyperpigmentationSkinHx HirsutismHx SkinErythemamaculesRashHx SkinErythemaNodosum SkinErythemapapulesRashHx SkinErythemapustulesRashHx SkinPetechiaeRashHx SkinUrticariaRashHx SkinFlushes SkinHerpesRashHx SkinItchinessHx PerineumItchinessHx PerianalItchinessHx FingersClubbing BreastGynecomastia Erythema SpiderAngioma Nausea Vomiting DryRetching HeartBurn UpperGIBleedSx LowerGIBleedSx DiarrheaSx FattyStool ChronicDiarrheaSx Constipation Stool StoolEvac VagueAbdSx AbdDiscomfortExacerbatedByStress AbdCramps FlatulenceAbdSx StomachPainSeveritySx StomachPainDistributionSx StomachPainResolvesPRDXSx PeriAnalPainSx PeriAnalSoilingSx StomachPainProgressionSubjective StomachPainLength StomachPainDuration RUQPain LUQPain RLQPain LLQPain RLFlankPain StomachPainPeriumbilicalArea StomachPainEpigastricArea RLInguinalPain BellowTheUmbAbdPain StomachPainPeriod AbdPainRadBack AbdPainImprovesLeaning AbdPainRadPerineum BackPainRadPerineum FastingPain EtohAbdPain EatingPain LayingdownPain StrainingPain FoodIntake Malnutrition EarlySatiety FluidIntake FluidNoLytesIntake SwallowPain SolidsSwallow FluidsSwallow ChokingSwallow RegurgFood FecalUrgency UrineSoilingSx BurningWithUrination UrinaryFrequency GrossHematuria DarkUrine FoamyUrine MicroscopicHematuriaRBCs UAProteinuria MicroscopicHematuriaOccult Nocturia UrinationRelieves WeakStream StrainStream UrinaryUrgency LessUrine Oliguria Polyuria Polydipsia StressIncoHx NonEmptyBladder UrgencyIncoHx ConstantIncoHx FemaleSpottingSx FemaleVaginalDryness MaleSpottingSx FemaleDCSx MaleDCSx VaginalSorenessSx VaginalItching PusMaleSpottingSx ScrotalPainSx HeavyPeriodsSx HematuriaAroundPeriod IrregularPeriodsSx LastPeriod DyspaureniaSx MaleProstatePainSx HxChildbirth AnyLocalNeuroFindings RestlessLegsSymptomsROS LocalizedSensoryDeficitHx LocalizedNeuroMotoLEHx LocalizedNeuroSensUEHx LocalizedNeuroSensLEHx LocalizedNeuroMotoUEHx GeneralizedWeakness AMS DecreasedLongTermMemory DecreasedLongTermMemoryOnExam DecreasedShortTermMemoryOnExam DecreasedShortTermMemory Seizure AphasiaHx AphasiaHxSensory LossOfConsciousness LossOfConsciousnessProdrome LossOfConsciousnessProdromePalpitations LossOfConsciousnessProdromeChestPain LossOfConsciousnessHeadache LossOfConsciousnessSeizures LossOfConsciousnessSphincter LossOfConsciousnessPostictall OrthostaticLightheadedness DizzinessWithPosition DizzinessWithExertion HeadacheFrontal HeadacheAssociatedWithHTN HeadacheAssociatedWithStress HeadacheAssociatedWithDecreasedCaffeineIntake HeadacheThunderclap HeadacheTemporal HeadacheOther HeadacheIntensity Photophobia Phonophobia HeadachePulsatile HeadacheSqueezing TearingOfEye HeadacheTiming HeadacheAssociatedWithNausea HeadacheAssociatedWithPhysicalActivity HeatIntolerance ColdIntolerance SaltCraving Pica HallucinationsROS NeckStiffn LowbackPain LowbackSeverity LowbackPainFlexion LowbackPainTrig LowbackPainSleep LowbackPainExercise BoneLocPain JointsPain BoneGenPain MuscleGenPain GoutyRosPain GoutyRosPainProgression SpinePain RestingPainInLowerExtremities TraumaToToesWithNoSkinBrake HeightDecreased PMHXChestTrauma PMHXMarfanSyndrom PMHXHeadTrauma PMHXCOPD PMHXAsthma PMHXAtopicDermatitis PMHXBPInf PMHXRiskFxDVT PMHXSpontanousAbortion PMHXofDVTorPE PMHXofSVT PMHXCHF PMHXCAD PMHXOfThoracicAorticAneurysmOrDissection PMHXPVD PMHXCVA PMHXICH ThyroidBruit PMHXAFib PMHXHTN ResistantHypertension EarlyOnsetOfHypertension AbruptOnsetOfHypertension LateOnsetOfHypertension PMHXDM1 PMHXDM2 PMHXHyperlipidemia PMHXPCDM PMHXKidneyStone PMHXPUD PMHXERCP PMHXAbdominalSurgery PMHXBowelObstruction PMHXRecentAngiography PMHXVeneral PMHXHIV PMHXHypo PMHXCKD PMHXGout PMHXBPH PMHXBladderCancer PMHXProstateCancer PMHXOvarianC PMHXChrons PMHXCU PMHXPancreatitis PMHXColonPolyp PMHXAbdominalRadiation PMHXAbdominalHernia PMHXAtypicalDuctalorLobularHyperplasiaOrLobularCarcinomaOnPriorBreastBiopsy PMHXBRCA12positivity AgeAtMenarche AgeAtMenopause AgeAtFirstBirth PMHXGE PMHXLiverCirrhosis PMHXVarices PMHXPeritionitis PMHXVGallStones PMHXDiverticulosisDiverticulitis PMHXDiverticulosisDiverticulosis PMHXColonCancer PMHXDepression PMHXSubstanceAbuse PMHXPsychOtherThanDepresion PMHXAspiration PMHXPneumonia PMHXURTI PMHXTonsillectomy PMHXDentalWork PMHXID PMHXAutoimmune PMHXMalNeo PMHXContactHospital PMHXContactDialysis PMHXContactWoundCare PMHXContactNursingHome PMHXWoundCurrent PMHXDialysisCurrent PMHXHepatitisC PMHXHepatitisB Anticoag CurrentUseOfHormonalReplacementTherapy BronchoDilators Diuretics DiureticsRecentlyStartedOrIncreased PatientOnDiuretics DiureticsOvert AllergicToDye WoundCareRecent PoAbxMed OpiatesMed IVAbxMed ACEARB ACEARBUseCausedAzotemia NSAIDSMed ContrastIodine TCAMed AntiCholinergicMed SerotoninergicMed BZDMed LithiumMed ThisSeasonsFluVaccineGiven CovidVaccineTaken AllergyMeds NeutropeniaMeds PancreatitisMeds NitratesMeds NitratesMedsRelatedToHeadaches MedsRecentChemotherapy HistoryOfChestRadiation FHCOPD FHAsthma FHAtopicDermatitis FHCAD FHHTN FHDM FHDVTPEParent FHIBDCD FHIBDCU FHMEN2 FHProstateCa FHBreastCancer FHVHL FHNF1 FHEarlyCC ExposurePneumonitis ExposureBladderCancer Smoker ETOH RecentIVDrugs RecentCocaineUse DustExposure TBExposure SexExposure SexActive PregnancyPossible UrinePregnancyTest ExposureToCovid Gender Race Anisocoria Pupils PupilsReaction Conjunctivas ConjunctivasPale Exophtalmos Acuity Blindness NoseCongestion SinusesTender ThroatExam DentalHygiene DryMMExam GlossitisOnExam HistoryOfHavingWetEar HistoryOfEarTraumaPriorToPain OtoscopicSerous OtoscopicPus DischargeFromEar MeatusTender MeatusEdematous MeatusErythematous OtoscopicErythema OtoscopicBulding NeckStiffness NeckSwollen ThyroidEnlarged ThyroidNodules AnteriorCervicalNodesExam Rales Rhonchi Wheezing DecreasedBreathSounds AccessoryMuscles ProlongedExpPhase RhythmRegular JVD OrthopneaExam EarlySystolicHolosystolicMurmurAtApexMR EarlySystolicHolosystolicMurmurAtApexRadiationMR EarlySystolicHolosystolicMurmurLeftSternalBorderTR EarlySystolicHolosystolicMurmurLeftSternalBorderRadiationTR EarlySystolicHolosystolicMurmurAtTheLeftLowerSternalBorderVSD EarlySystolicHolosystolicMurmurAtTheLeftLowerSternalRadiationVSD MidSystolicEjectionMurmurAtTheRightSternalBorderAS MidSystolicEjectionMurmurAtTheRightSternalBorderRadiationAS EarlyDiastolicMurmurAR EarlyDiastolicMurmurRadiationAR GrahamSteell PDAM PericardialFriction RS3Tone RS4Tone LS3Tone LS4Tone AsymmetricEdemaLE Edema TenderLE DVTSg LegsWarm LegsRed DistalPulsesLE ColdLowerLimbTips ClaudicationLowerExtremities ColdUpperLimbTips FemoralPulses BloodPressureDifference BloodPressureDifferenceLR PulseStrenghtDifferenceLR CarotidBruits RenalBruits EpigastricTender LowerMidAbdTender PeriumbilicaAbdTender RUQTender LUQTender RLLQTender ReboundTenderness AbdGuarding AbdAscites CaputMedusae MurphysSign BowelSounds PsoasSign RovsingSign CullenSign MalnutritionByExam GreyTurnersign BladderFull BladderEmpty RLInguinalAreaTender RLInguinalAreaCoughBulge InguinalLymphadenopathy AxillaryLymphadenopathy RectalExamHemorrhoids RectalExamRectalCancer RectalExamFissure RectalExamBlood HepatomegalyEx SplenomegalyEx IrregularLiverEx TestisTenderPE TestisEnlarged TestisIrregular GoldflamsSign RectalExamProstateTEnder RectalExamProstateEnlarged RectalExamProstateHardened RectalExamProstateIrregular PresenceOfPunctateHaemorrhagesOnVaginalExam PresenceOfThinAndDryMucosa PresenceOfVulvarInflamation Cyanosis SubcutaneousFatNecrosis Panniculitis SignsOfInfectionAtExitSitesOfCatheters SkinMoistureExam Jaundice SkinPetechiaeRashExam SkinExfoliativeRashExam SkinIschemicChanges SkinUrticariaRashExam CondylomataExam SkinHerpesRashExam SkinErythemamaculesRasExam SkinErythemaNodosumExam SkinErythemapapulesRashExam SkinErythemapustulesRashExam SkinFlushingExam AtaxiaLE AtaxiaUE Myoclonus Dysarthria Tremor PickingObjects MuscleRigidity LocalizedNeuroSensLEEx LocalizedNeuroMotoLEEx LocalizedNeuroSensUEEx LocalizedNeuroMotoUEEx LocalizedSensoryDeficitEx LocalizedMotorDeficitEx GeneralizedWeaknessExam AphasiaExam MeningealSigns RombergsSign BabinskiSign FeetClonus GeneralHyperreflexia StraightLegRaise CrossedStraightLegRaise WeakAnkle WeakKnee NystagmusEyeMovements GoutyExamTenderness GoutyExamWarmth GoutyExamEdema LumbarLordosis ParaspinalMuscles LimitedSpine TspineTenderEx LspineTenderEx SspineTenderEx HallucinationsOnExam CspineTenderEx MSVerbalContact MSOrientation MSFullyAwakens MSDrowsiness MSStimulusAwakens MSAgitated HGBlevel DropInHGBlevelWithinLast24Hours MCVlevel WBClevel LymphocyteLevel SerumCreatinine SerumCreatinineAtBaseline BaselineeGFR PlateletsLevel INR TSAT FerritinLab FolateLab B12 Lab MMALevel HomocysteineLevel IntrinsicFactorLab antiPLA2Rab antiGBM antiTHSD7Aab HepatitisCAntibodiesTotalIgGAndIgM Albuminlevel CRPlevel ESRlevel AldoRenin TSHFeature Aldosterone Potassium DDimer TroponinI PCT LDH HaptoglobinLab UricAcidLevel AST ALT Amylase Lipase TotalBilirubin AlkalinePhosphatase SerumCK BNP PSA Bicarb Calcium TriglyceridesLevel CholesterolLevel LacticAcid AnionGap BetaHydroxyButyrate Hba1c GAD65 InsulinAA TyrosinePhosphatases IsletCellAA ZincTransporterZNT8 FastingGlucose TwoHrPlasmaGlucoseDuringOGTT RandomBloodGlucose Proteinuria Albuminuria FeaturesOfHematuriaOnUA SerumbHCG PelvicUSForEctopicPregnancy PelvicUSForNlPregnancy gFOBT pCO2onABG pHonABG pHofVaginalDc HypercapniaOnAbg FeaturesOfInflamationOnUA GramStainUrineGonococcus WetMountResults WhiffTestResults BuddingYeastMyceliaAfterKOH RightVentricleStrainOnEcho DecreasedEFonECHO SegmentalDyskinesiaHypokinesiaAkinesiaECHO AorticDissectionTEE StressECGCAD StressEchoCAD StressNuke OSAOnSleepStudy FEV1toFVCRatio FEV1toFVCRatioImprovingBy12BeforeAndAfterBronchodilator CxrayFocalInfiltrate CxrayPTX ChestCTPTX XrayDoubleBariumEnemaForColonCa HydroOnCT GroundGlassOnChestCt IntersitialAbnormalitiesOnChestCt LocalPatchyInfiltratesOnChestCt DiverticulitisOnCt AppendicitsOnUS AppendicitsOnCT RenalArteriesDigitalSubstractionAngiography RenalArteriesMagneticResonanceAngiographyWithGadolinum RenalArteriesMagneticResonanceAngiographyWithoutGadolinum RenalArteriesCTAngiographyWithIVDye ThoracicAortaCTAngiographyWithIVDye PEonCTAngio PEonVQScan RVStrainOnCTAngio BiliaryColicOnCt BiliaryCollicOnUS BiliaryCollicOnEUS PeriNephricStrandingOnCT LBOOnAbdominalPlainRadiograph LBOonCTwDye LBOonCT SBOOnAbdominalPlainRadiograph PneumoperitoneumAbdXray PneumoperitoneumChestXray PneumoperitoneumChestCT PneumoperitoneumAbdCT SBOonCTwDye SBOonCT SBOOnBedsideUltrasound IschemicColitisOnUltrasound AMIOnAbdominalPlainRadiograph AMIODigitalSubstractionAngiography AMIonCTAngio AMIonCT IschemicColitis XrayBariumEnemaForLBO NephrolithiasisOnCT NephrolithiasisOnUS UreterolithiasisOnCT UreterolithiasisOnUS ColonMalignancyOnCTColonography DenseBreastTissueOnMammography HydroOnUS RenalArterieDuplexUltrasonography RenalAsymmetryOnUS USProstateEnlarged ElevatedPVR ThickenedBladderWall BladderMalignancyOnUS JugularVeinFacialVeinsThrombosis ArterialLowerExtremitiesDopplers FirstExtremitiesDopplersToRuleOutDVT SecondExtremitiesDopplersToRuleOutDVT ExtremitiesDopplersToRuleOutSVT JugularVeinFacialVeinsThrombosisonCT CxrayPleuralEffusion CxrayWidenedMediastinum CxrayBlInfilEdema CxrayBilInfiltrates BrainCTNonContrastForSAH CranialCTNonContrastForChronicSinusitis CranialCTNonContrastForAcuteSinusitis ParanasalSinusesTargetedXrayForSinusitis BrainCTNormal BrainMRINormal BrainMRIWithGadNormal BrainCTContrastNormal BrainCTNonContrastForICH BrainCTNonContrastForIschemicCVA BrainMRIForIschemicCVA MembranousNephropathyOnBiopsy GoodpastureSyndromeonKidneyBiopsy NephriticSyndromeonKidneyBiopsy NephroticSyndromeonKidneyBiopsy MSUInSynovialFluid LumbarPunctionFluidForSAH TransrectalProstateBiopsy CirrhosisOnLiverBiopsy BreastBiopsy BRCA12GeneticTesting PCRCovid PCRGonococcus PCRChlamydia PCRRNAHepC PCRFlu HIV1HIV2ElisaResults PCRHIVDNA HIVWesternBlot BloodCulturesx2 CdiffStoolToxin StoolForOvasAndParasites LegionellaUrinaryAntigenFeature StreptococcusUrinaryAntigenFeature ThroatCulture StoolCulture ThroatCultureForFusobacteriumNecrophorum BloodCultureForFusobacteriumNecrophorum RapiStrepTest DeviceBloodCultures RapidFluAntigenTesting LactoseHydrogenTest UreaBreathTest StoolAntigenForHPylori RapidUreaseTestEGD UConColonoscopyPathology ColonMalignancyOnColonoscopy EsophagitisOnEGD AnalFissureOnCScope AnalFissureOnCSigmoidoscopy CrohnsOnColonoscopy CrohnsOnEGD CrohnsOnMRI CrohnsOnCT GastritisOnEGD GallStonesInCysticDuctMRIMRCP AcuteCholecystitisConfirmationByUS AcuteCholecystitisConfirmationByHIDA GallStonesInPancreaticDuctCT GallStonesInPancreaticDuctMRIMRCP GallStonesInCommonBileDuctMRIMRCP GallStonesInGallBladerMRIMRCP GallStonesERCP GallStonesEUS PUDOnEGD BleedingPUDOnEGD BleedingEsophagealVarices EsophagealVaricesOnEGD EsophagealVaricesOnCT CirrhosisOnCT UrogramCT UrineCytology PollenAllergyTesting DustMitesAllergyTesting CystoscopyWithBiopsies ChronicPancreatitisOnAbdXray ChronicPancreatitisOnCt AcutePancreatitisOnAbdCT CirrhosisOnFibroScan CirrhosisOnMRI CirrhosisOnUS ProstateMalignancy BreastMalignancy ElectrocardiogramIschemicChangesNSTEMI ElectrocardiogramNonsepcificSTChanges ElectrocardiogramIschemicChangesSTEMI ElectiveCoronaryAngiogram CTCoronaryAngiogram CoronaryAngiogram RHCRv RHCLv CoronaryAngiogramAorticDissectionFound ElectrocardiogramHeartBlock ElectrocardiogramPreExcitation ElectrocardiogramHyperkalemia ElectrocardiogramHypokalemia ElectrocardiogramHypocalcemia ElectrocardiogramHypercalcemia 	2023-10-04 08:22:47.154758	2023-10-04 08:22:47.154758
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20231003194556
20231003195050
20231004061615
\.


--
-- Name: consultation_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultation_requests_id_seq', 5, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_id_seq', 5, true);


--
-- Name: recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recommendations_id_seq', 10, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: consultation_requests consultation_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_requests
    ADD CONSTRAINT consultation_requests_pkey PRIMARY KEY (id);


--
-- Name: patients patients_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_email_key UNIQUE (email);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_consultation_requests_on_patient_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_consultation_requests_on_patient_id ON public.consultation_requests USING btree (patient_id);


--
-- Name: index_recommendations_on_consultation_request_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_recommendations_on_consultation_request_id ON public.recommendations USING btree (consultation_request_id);


--
-- Name: recommendations fk_rails_1b7e4221fd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT fk_rails_1b7e4221fd FOREIGN KEY (consultation_request_id) REFERENCES public.consultation_requests(id);


--
-- Name: consultation_requests fk_rails_c9c27c73d2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_requests
    ADD CONSTRAINT fk_rails_c9c27c73d2 FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- PostgreSQL database dump complete
--

