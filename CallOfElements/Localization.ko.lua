
--[[ ----------------------------------------------------------------

			K O R E A N

-------------------------------------------------------------------]]

if( GetLocale() == "koKR" ) then

-- Errors
-- -------
COESTR_NOTASHAMAN = "주술사가 아닙니다. Call of Elements를 끕니다.";
COESTR_NOTOTEM = "아직 사용가능한 토템이 없습니다.";
COESTR_UI_NOTASSIGNED = "<할당된 텍스트가 없습니다>";
COESTR_INVALIDELEMENT = "토템에서 유효하지 않은 요소가 있습니다.: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s|1이;가; %d초 남았습니다.";
COESTR_TOTEMEXPIRED = "%s|1이;가; 사라졌습니다.";
COESTR_TOTEMDESTROYED = "%s|1이;가; 파괴되었습니다.";
COESTR_SWITCHTOSET = "%s 토템 셋이 활성화되었습니다.";
COESTR_FIXEDSETS = "토템셋의 시전순서 배치가 정정되었습니다.";
COESTR_UDATEDSAVED = "저장된 변수가 업데이트 되었습니다. 버전 ";
COESTR_FIXEDDISPLAY = "SavedVariables에 있던 에러가 정정되었습니다.";
COESTR_TOTEMSRELOADED = "토템을 다시 읽어들였습니다.";
COESTR_RESTARTINGSET = "활성화셋을 재시작했습니다.";
COESTR_RESET = "타이머를 초기화하였습니다.";
COESTR_HEALCOOLDOWN = " - 아직 준비되지 않았습니다!";
COESTR_NOHEALING = "치유할 필요가 없습니다.";
COESTR_HEALING = "%s에게 %s(%d레벨)|1을;를; 시전합니다.";
COESTR_HEALLOWERRANK = "마나가 충분하지 않습니다. 대신에 %d레벨을 사용하십시오.";
COESTR_HEALOOM = "마나가 부족합니다!";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "토템";
COESTR_TOTEMTOOLS = "도구: (.+)의 토템";
COESTR_TOTEMMANA = "마나 (%d*)";
COESTR_TOTEMRANK = "(%d) 레벨";
COESTR_MINUTEDURATION = "(%d%.%d%d)분";
COESTR_MINUTEDURATION_INT = "(%d)분";
COESTR_SECDURATION = "(%d%d?)초";
COESTR_CASTBYNAME = "%((%d) 레벨%)";
COESTR_TOTEMDAMAGE = { ".+|1이;가; (.+ 토템) ?%u*|1을;를; 공격하여 (%d+)의 .*[치명상피해을를] 입혔습니다.*", ".+|1이;가; .+|1으로;로; (.+ 토템) ?%u*에게 (%d+)의 .*[치명상피해을를] 입혔습니다.*" };
COESTR_TOTEMHEALTH = { "생명력 (%d*)", "(%d*)의 생명력" };
COESTR_SHOCKSPELL = "(.* 충격)";
COESTR_HEALINGWAVE = "치유의 물결";
COESTR_LESSERWAVE = "하급 치유의 물결";
COESTR_MINAMOUNT = "(%d*)~";
COESTR_MAXAMOUNT = "~(%d*)";
COESTR_TRINKET = "^.*%[사로잡힌 물의 정령%].*$"; 



-- Totem Advisor
-- --------------
COESTR_POISON = "독";
COESTR_DISEASE = "질병";
COESTR_TOTEMPOISON = "독 정화 토템";
COESTR_TOTEMDISEASE = "질병 정화 토템";
COESTR_TOTEMTREMOR = "진동의 토템";
COESTR_CLEANSINGTOTEM = "%s - 지금 사용 하세요!";

COESTR_TREMOR = {
	"수면", "공포", "영혼의 절규", "정신 지배", "우레와같은 울부짖음",
	"위협의 외침", "공황", "공포의 비명소리", "현혹",
	"공포의 울부짖음", "위협의 포효", "수정의 자장가", "드루이드의 동면"
}


-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "대지";
COESTR_TOTEMTOOLS_FIRE = "불";
COESTR_TOTEMTOOLS_WATER = "물";
COESTR_TOTEMTOOLS_AIR = "바람";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "대지";
COESTR_ELEMENT_FIRE = "불";
COESTR_ELEMENT_WATER = "물";
COESTR_ELEMENT_AIR = "바람";



-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "닫기";
COE_ConfigTotemTabPanel = "토템 옵션";
COE_ConfigHealingTabPanel = "치유 옵션";
COE_ConfigDebuffTabPanel = "디버프 옵션";
COE_ConfigTotemTotemBar = "토템바";
COE_ConfigTotemTotemOptions = "옵션";
COE_ConfigTotemTotemSets = "토템셋";
COE_OptionEnableTotemBar = "토템바 켜기";
COE_OptionHideBackdrop = "비활성화 상태일 때 배경 숨기기";
COE_OptionEnableTimers = "토템 타이머 켜기";
COE_OptionEnableTimerNotifications = "알림 켜기";
COE_OptionTTAlignment = "툴팁 정렬";
COE_OptionDisplayMode = "앵커 버튼";
COE_OptionDisplayAlignment = "버튼 정렬";
COE_OptionAdvisor = "토템 도우미 켜기";
COE_OptionEnableSets = "토템셋 켜기";
COE_OptionEnableAutoSwitch = "PVP시 토템셋 자동전환";
COE_OptionActiveSet = "토템셋 활성화";
COE_OptionNewSet = "새 토템셋";
COE_OptionDeleteSet = "토템셋 삭제";
COE_OptionConfigureSet = "토템셋 설정";
COE_OptionStopConfigureSet = "확인";
COE_OptionCastOrderString = "시전 순저";
COE_OptionConfigureBar = "토템 설정";
COE_OptionFixBar = "토템바 위치 고정";
COE_OptionConfigureOrder = "순서 설정";
COE_OptionScanTotems = "토템 다시 읽기";

COE_OptionCurrentFrame = "바 설정";
COE_OptionDirection = "방향";
COE_OptionFrameMode = "바 모드";
COE_OptionFlexCount = "고정 버튼";
COE_OptionScaling = "크기";
COE_OptionEnableTimerFrame = "타이머 프레임을 분리 상태로 보여주기";
COE_OptionGroupBars = "그룹으로 바 움직이기";
COE_OptionOverrideRank = "1레벨 사용";
COE_OptionFrameTimersOnly = "타이머를 타이머 프레임에만 나타내기";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "토템 옵션을 보여줍니다.";
COE_ConfigHealingTab = "치유 옵션을 보여줍니다.";
COE_ConfigDebuffTab = "디버프 옵션을 보여줍니다.";
COE_OptionEnableTotemBar = "토템바를 보이도록 설정합니다.";
COE_OptionHideBackdrop = "마우스가 토템바위에 없을 때 배경을 감춥니다.";
COE_OptionEnableTimers = "토템버튼 안쪽에 토템의 남은 시간을 표시합니다.";
COE_OptionEnableTimerNotifications = "토템의 유효시간이 지나거나 파괴되었을 때 경고를 표시합니다.";
COE_OptionAdvisor = "파티나 공격대에 토템으로 치유할 수 있는 디버프에 걸린 플레이어가 있을 경우 알림을 표시합니다.";
COE_OptionEnableAutoSwitch = "적 플레이어에 따라 자동으로 직업 토템셋을 변경합니다.";
COE_OptionFixBar = "토템바의 위치를 고정시킵니다. 이 기능은 갑자기 토템바를 드래그하는 경우를 방지합니다.";
COE_OptionGroupBars = "하나의 바를 움직이면 다른 바들도 같이 움직입니다.";
}

COESTR_TRINKET_TOOLTIP = "사로잡힌 물의 정령"; 
COESTR_TRINKET_TOTEM = "고대의 마나셈 토템";

-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "좌 상단" };
{ "ANCHOR_LEFT"; "좌" };
{ "ANCHOR_BOTTOMLEFT"; "좌 하단" }; 
{ "ANCHOR_TOPRIGHT"; "우 상단" };
{ "ANCHOR_RIGHT"; "우" };
{ "ANCHOR_BOTTOMRIGHT"; "우 하단" };
{ "DISABLED"; "끄기" };
}

COEUI_DISPLAYMODE = { "사용자 설정", "타이머만", "활성화된 셋" }
 
COEUI_DISPLAYALIGN = { "상자", "세로", "가로" }

COEUI_PVPSETS = { "[PVP] 드루이드", "[PVP] 사냥꾼", "[PVP] 마법사", "[PVP] 성기사", "[PVP] 사제", 
	"[PVP] Rogue", "[PVP] 주술사", "[PVP] 흑마법사", "[PVP] 전사" }
COEUI_DEFAULTSET = "Default";

COEUI_OVERRIDERANK = { "키없음", "SHIFT키 사용", "ALT키 사용", "CTRL키 사용" };

COEUI_CURRENTFRAME = { "대지", "불", "물", "바람" };

COEUI_DIRECTION = { "위", "아래", "왼쪽", "오른쪽" };

COEUI_FRAMEMODE = { "닫힘", "열림", "수축", "감춤" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "설정 대화상자 보기";
BINDING_NAME_COEBESTHEAL = "최적 치유";
BINDING_NAME_COEBATTLEHEAL = "전투 치유";
BINDING_NAME_COETHROWADVISED = "토템도우미가 알려준 토템 놓기";
BINDING_NAME_COENEXTSET = "다음 토템셋 활성화";
BINDING_NAME_COETHROWSET = "활성화된 토템셋 놓기";
BINDING_NAME_COERESTARTSET = "활성화된 토템셋 재시작";
BINDING_NAME_TOTEMEARTH1 = "대지의 토템 #1";
BINDING_NAME_TOTEMEARTH2 = "대지의 토템 #2";
BINDING_NAME_TOTEMEARTH3 = "대지의 토템 #3";
BINDING_NAME_TOTEMEARTH4 = "대지의 토템 #4";
BINDING_NAME_TOTEMEARTH5 = "대지의 토템 #5";
BINDING_NAME_TOTEMFIRE1 = "불의 토템 #1";
BINDING_NAME_TOTEMFIRE2 = "불의 토템 #2";
BINDING_NAME_TOTEMFIRE3 = "불의 토템 #3";
BINDING_NAME_TOTEMFIRE4 = "불의 토템 #4";
BINDING_NAME_TOTEMFIRE5 = "불의 토템 #5";
BINDING_NAME_TOTEMWATER1 = "물의 토템 #1";
BINDING_NAME_TOTEMWATER2 = "물의 토템 #2";
BINDING_NAME_TOTEMWATER3 = "물의 토템 #3";
BINDING_NAME_TOTEMWATER4 = "물의 토템 #4";
BINDING_NAME_TOTEMWATER5 = "물의 토템 #5";
BINDING_NAME_TOTEMWATER6 = "물의 토템 #6";
BINDING_NAME_TOTEMAIR1 = "바람의 토템 #1";
BINDING_NAME_TOTEMAIR2 = "바람의 토템 #2";
BINDING_NAME_TOTEMAIR3 = "바람의 토템 #3";
BINDING_NAME_TOTEMAIR4 = "바람의 토템 #4";
BINDING_NAME_TOTEMAIR5 = "바람의 토템 #5";
BINDING_NAME_TOTEMAIR6 = "바람의 토템 #6";
BINDING_NAME_TOTEMAIR7 = "바람의 토템 #7";


-- Key modifiers
-- --------------
COEMODIFIER_ALT = "ALT";
COEMODIFIER_ALT_SHORT = "A";
COEMODIFIER_CTRL = "CTRL";
COEMODIFIER_CTRL_SHORT = "C";
COEMODIFIER_SHIFT = "SHIFT";
COEMODIFIER_SHIFT_SHORT = "S";
COEMODIFIER_NUMPAD = "Num Pad";
COEMODIFIER_NUMPAD_SHORT = "NP";


-- Shell commands
-- ---------------
COESHELL_INTRO = "Call Of Elements에서 사용가능한 쉘 명령어:";
COESHELL_CONFIG = "'/coe' or '/coe config' - 설정 대화상자를 엽니다.";
COESHELL_LIST = "'/coe list' - 이 목록을 보여줍니다.";
COESHELL_NEXTSET = "'/coe nexset' - 다음 사용자정의 토템셋 또는 기본토템셋을 전환합니다.";
COESHELL_PRIORSET = "'/coe priorset' - 기본 토템셋과 사용자정의 우선토템셋을 전환합니다.";
COESHELL_SET = "'/coe set <name>' - 지정된 이름의 토템셋으로 전환합니다. <name>은 (영문)대소문자를 구분합니다.";
COESHELL_RESTARTSET = "'/coe restartset' - 다음 번에 토템셋을 박을 때, 현재 활성화된 토템셋의 모든 토템을 처음부터 다시 시전합니다.";
COESHELL_RESET = "'/coe reset' - 모든 타이머와 활성화된 토템셋을 초기화합니다.";
COESHELL_RESETFRAMES = "'/coe resetframes' - 모든 엘리먼트바를 화면 중간으로 위치시킵니다.";
COESHELL_RESETORDERING = "'/coe resetordering' - 토템바의 순서를 초기화합니다.";
COESHELL_RELOAD = "'/coe reload' - 모든 토템과 토템셋의 설정을 다시 읽어들입니다.";
COESHELL_MACRONOTE = "다음 명령어들은 액션바에 있을 때 매크로로써만 작동합니다.:";
COESHELL_THROWSET = "'/coe throwset' - 활성화된 토템셋을 박습니다.";
COESHELL_ADVISED = "'/coe advised' - 다음 제안된 토템을 박습니다.";

end