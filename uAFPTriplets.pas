unit uAFPTriplets;

interface

const//AFP Triplets sorted by abbreviation
// ! SWAP ordered !
  afpBAG = $D3A8C9; // Begin Active Environment Group
  afpBBC = $D3A8EB; // Begin Bar Code Object
  afpBCA = $D3A877; // Begin Color Attribute Table
  afpBDA = $D3EEEB; // Bar Code Data
  afpBDD = $D3A6EB; // Bar Code Data Descriptor
  afpBDG = $D3A8C4; // Begin Document Environment Group
  afpBDI = $D3A8A7; // Begin Document Index
  afpBDT = $D3A8A8; // Begin Document
  afpBFG = $D3A8C5; // Begin Form Environment Group (Obsolete)
  afpBFM = $D3A8CD; // Begin Form Map
  afpBGR = $D3A8BB; // Begin Graphics Object
  afpBII = $D3A87B; // Begin IM Image (C)
  afpBIM = $D3A8FB; // Begin Image Object
  afpBMM = $D3A8CC; // Begin Medium Map
  afpBMO = $D3A8DF; // Begin Overlay
  afpBNG = $D3A8AD; // Begin Named Page Group
  afpBOC = $D3A892; // Begin Object Container
  afpBOG = $D3A8C7; // Begin Object Environment Group
  afpBPG = $D3A8AF; // Begin Page
  afpBPS = $D3A85F; // Begin Page Segment
  afpBPT = $D3A89B; // Begin Presentation Text Object
  afpBR  = $D3A8CE; // Begin Resource (R)
  afpBRG = $D3A8C6; // Begin Resource Group
  afpBSG = $D3A8D9; // Begin Resource Environment Group
  afpCAT = $D3B077; // Color Attribute Table
  afpCDD = $D3A692; // Container Data Descriptor
  afpCTC = $D3A79B; // Composed Text Control (O)
  afpEAG = $D3A9C9; // End Active Environment Group
  afpEBC = $D3A9EB; // End Bar Code Object
  afpECA = $D3A977; // End Color Attribute Table
  afpEDG = $D3A9C4; // End Document Environment Group
  afpEDI = $D3A9A7; // End Document Index
  afpEDT = $D3A9A8; // End Document
  afpEFG = $D3A9C5; // End Form Environment Group (Obsolete)
  afpEFM = $D3A9CD; // End Form Map
  afpEGR = $D3A9BB; // End Graphics Object
  afpEII = $D3A97B; // End IM Image (C)
  afpEIM = $D3A9FB; // End Image Object
  afpEMM = $D3A9CC; // End Medium Map
  afpEMO = $D3A9DF; // End Overlay
  afpENG = $D3A9AD; // End Named Page Group
  afpEOC = $D3A992; // End Object Container
  afpEOG = $D3A9C7; // End Object Environment Group
  afpEPG = $D3A9AF; // End Page
  afpEPS = $D3A95F; // End Page Segment
  afpEPT = $D3A99B; // End Presentation Text Object
  afpER  = $D3A9CE; // End Resource (R)
  afpERG = $D3A9C6; // End Resource Group
  afpESG = $D3A9D9; // End Resource Environment Group
  afpFGD = $D3A6C5; // Form Environment Group Descriptor (Obsolete)
  afpGAD = $D3EEBB; // Graphics Data
  afpGDD = $D3A6BB; // Graphics Data Descriptor
  afpICP = $D3AC7B; // IM Image Cell Position (C)
  afpIDD = $D3A6FB; // Image Data Descriptor
  afpIEL = $D3B2A7; // Index Element
  afpIID = $D3A67B; // IM Image Input Descriptor (C)
  afpIMM = $D3ABCC; // Invoke Medium Map
  afpIOB = $D3AFC3; // Include Object
  afpIOC = $D3A77B; // IM Image Output Control (C)
  afpIPD = $D3EEFB; // Image Picture Data
  afpIPG = $D3AFAF; // Include Page
  afpIPO = $D3AFD8; // Include Page Overlay
  afpIPS = $D3AF5F; // Include Page Segment
  afpIRD = $D3EE7B; // IM Image Raster Data (C)
  afpLLE = $D3B490; // Link Logical Element
  afpMBC = $D3ABEB; // Map Bar Code Object
  afpMCA = $D3AB77; // Map Color Attribute Table
  afpMCC = $D3A288; // Medium Copy Count
  afpMCD = $D3AB92; // Map Container Data
  afpMCF = $D3AB8A; // Map Coded Font
  afpMCF1= $D3B18A; // Map Coded Font Format-1 (C)
  afpMDD = $D3A688; // Medium Descriptor
  afpMDR = $D3ABC3; // Map Data Resource
  afpMFC = $D3A088; // Medium Finishing Control
  afpMGO = $D3ABBB; // Map Graphics Object
  afpMIO = $D3ABFB; // Map Image Object
  afpMMC = $D3A788; // Medium Modification Control
  afpMMO = $D3B1DF; // Map Medium Overlay
  afpMMT = $D3AB88; // Map Media Type
  afpMPG = $D3ABAF; // Map Page
  afpMPO = $D3ABD8; // Map Page Overlay
  afpMPS = $D3B15F; // Map Page Segment
  afpMSU = $D3ABEA; // Map Suppression
  afpNOP = $00D3EEEE; // No Operation //EEEED3
  afpOBD = $D3A66B; // Object Area Descriptor
  afpOBP = $D3AC6B; // Object Area Position
  afpOCD = $D3EE92; // Object Container Data
  afpPFC = $D3B288; // Presentation Fidelity Control
  afpPGD = $D3A6AF; // Page Descriptor
  afpPGP = $D3B1AF; // Page Position
  afpPGP1= $D3ACAF; // Page Position Format-1 (C)
  afpPMC = $D3A7AF; // Page Modification Control
  afpPTD = $D3B19B; // Presentation Text Data Descriptor
  afpPTD1= $D3A69B; // Presentation Text Descriptor Format-1 (C)
  afpPTX = $D3EE9B; // Presentation Text Data
  afpTLE = $D3A090; // Tag Logical Element

implementation

end.
