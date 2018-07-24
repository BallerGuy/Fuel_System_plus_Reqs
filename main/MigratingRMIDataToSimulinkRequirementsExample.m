%% Migrating Requirements Management Interface Data to Simulink(R) Requirements(TM)
% This example demonstrates the basic steps to update 
% Requirements Management Interface (RMI) links to the format used
% by the new Simulink Requirements interface. Legacy RMI data consists of
% traceability link information, stored either in a separate |.req|
% file or embedded in a Simulink(R) model file. With the Simulink
% Requirements product, you can view requirements and links in
% the Simulink Editor, while preserving existing links from your
% design elements to external documents. Additionally, you can author
% requirements in the Simulink environment, and establish relationships between
% requirements, model entities, and test cases.

% Copyright 2017 The MathWorks, Inc.

%% Workflow
% In this example, you follow this general workflow:
%
% # You start with a model that has links to requirements in external
% documents.
% # You create a new requirement set.
% # You import the requirements from the external documents, creating
% requirements in the set that reference the external documents.
% # You update the model link destinations to the imported requirements.

%% Create a Requirement Set
% Open the editor by entering the command
%
%   slreq.editor()

%%
% Create a new requirement set:
%
% # In the Requirements Editor toolstrip, click 
% the *New Requirement Set* button. 
% # Enter a filename, such as |FuelSysRequirements|. Save the requirement
% set.
% 

%% Import Requirements from External Documents
%
% Requirements import supports Microsoft(R) Word and Excel(R) documents.
% For this example, you create requirements from three documents:
%
% * |FuelSysDesignDescription.docx|
% * |FuelSysRequirementsSpecification.docx|
% * |FuelSysTestScenarios.xlsx|
% 
%%
% The requirements are contained in the |FuelSysRequirements| set. The
% requirements reference the content in the external documents.
%%
%
% 1. To import, start by right-clicking
% |FuelSysRequirements| in the *Index* and select *Import As Read-only
% References*.
%
% 2. In the Importing Requirements dialog box, select 
% |Microsoft Word Document| for the *Document type*. 
%
% 3. For *Document location*, browse for the
% |FuelSysDesignDescription.docx| file located on the path
% |fullfile(matlabroot,'examples','slrequirements')|.
% If the file is already open, you can select it from the drop-down list.
%

%%
% 4. Select options:
%
% * Select *Rich text (include graphics and tables)*.
% * Select *Use bookmarks to identify items and serve as custom IDs*. 
% This preserves links to existing document bookmarks in the new requirement set.

%%
% <<../ImportDialog2.png>>
%
%%
% 4. Click *Import*. The new requirement set appears in the Requirements Editor.
%
% <<../ReqEditor1.png>>

%%
% 5. You can navigate to the document. In the *Properties* pane, click
% *Show in document*.
%
% <<../MigrationDoc1.png>>

%% 
%    
%
%    
%%
% Now, import requirements from a Microsoft(R) Excel(R) document.
% When importing from Excel, you specify 
% which columns to import. You can map the columns to either *Summary*,
% *Keywords*, or *Custom Attribute* fields in the imported data.
% You can also locate specific ranges in tables by specifying a
% regular expression pattern of requirements identifiers.

%%
% 1. Open the |FuelSysTestScenarios.xlsx| file on the path 
% |fullfile(matlabroot('examples','slrequirements'))|.
% 
% <<../MigrationDoc2.png>>
%
%%
%
% 2. In the Requirements Editor, right-click |FuelSysRequirements| in the
% *Index* and select *Import As Read-only References*.

%%
% 3. Configure the import settings as shown.
%
% <<../ImportDialog3.png>>
%
%%
% 4. Click *Import*. A new top-level node contains references to the test
% scenario items in the Excel document.
%
% <<../ReqEditorExcelRefs.png>>

%%
% Repeat the import process for the file
% |FuelSysRequirementsSpecification.docx|.

%% Update Model Link Destinations 
%
% Update the model link destinations to the imported requirements:
%
% 1. Open the |FuelSysWithReqLinks| model on the path 
% |fullfile(matlabroot('examples','slrequirements'))|.
%
% 2. Enable the Requirements Perspective of the model. Click the icon at
% the lower-right of the model canvas and click the *Requirements* icon.
% The |FuelSysRequirements| set appears in the Requirements browser.
%
% 3. Right-click the |FuelSysRequirements| line item and select *Redirect
% Links to Imported References*.
%
% <<../update_links.png>>

%% Update Requirements that Reference External Documents
% 
% If you change the requirement content in the external document, update
% the Requirement Set to reflect the latest version:
%
% 1. Select the top-level node in the Requirements Editor.
%
% 2. In the Properties section, click the *Update* button.
%
% <<../ReqSetUpdate.png>>

%% Review the Imported References
% Importing the three documents creates three top-level nodes
% in the left pane of Requirements Editor. Save the sets.
%
% Expand the sub-trees and click on individual items to review the imported
% contents. Click the *Show in document* button for navigation to corresponding
% location in the original external document.
%
% <<../ReqEditor4.png>>

%% Load a Model with Links to Imported Documents
% In this step, you load a model with existing links to imported documents.
% If you have models with RMI data in the Simulink(R)
% Verification and Validation(TM) format, opening those models 
% with an available Simulink Requirements license prompts you save the
% requirements data in the updated Simulink Requirements format.
%
% Clicking *Save now* creates a Link Set |.slmx| file.  
%
%% 
% In this example, open the 
% |FuelSysWithReqLinks.slx| model on the path 
% |fullfile(matlabroot,'examples','slrequirements')|. Click the link to 
% create a Link Set file |FuelSysWithReqLinks.slmx|.
%
% <<../MigrationMdlDiagram1.png>>

%% 
% You can continue to use requirements highlighting and navigation.
% To highlight blocks with requirement links, 
% select *Analysis > Requirements Traceability > Highlight Model*
% from the menu. 
%
% <<../MigrationMdlDiagram2.png>>
%
% Right-click a highlighted block, and select the link label under the 
% *Requirements Traceability* section of the context menu. 
%
% <<../MigrationMdlDiagram3.png>>
%
% If the Requirements Editor is open, the reference item is
% highlighted. You can review the contents of the requirement in the
% *Properties* pane.
%
% <<../ReqEditor5.png>>
%
% The incoming link is displayed in the *Links* pane. With Simulink
% Requirements, you do not need to 
% insert navigation controls into Word and Excel(R) documents to know where
% the links are. You can find the links in Requirements Editor.
%
% A Simulink Requirements license is needed to use the Requirements Editor.
% When corresponding references are not loaded in Requirements Editor,
% navigation will bring you to the original content in the external
% document, as in previous versions. 
%
% <<../MigrationDoc3.png>>
%