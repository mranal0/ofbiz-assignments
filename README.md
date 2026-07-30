# OFBiz Assignments

This repository contains Apache OFBiz assignment work focused on custom data modeling and XML-based configuration.

## Repository Contents

### 1) `relationshipmgr/`
Custom OFBiz component for managing party and contact relationships.

Key areas:
- **Entity model** (`entitydef/entitymodel.xml`)  
  Defines custom entities such as `RmgrParty`, `RmgrPerson`, `RmgrOrganization`, `RmgrRoleType`, and contact mechanism entities.
- **Services** (`servicedef/services.xml`)  
  CRUD-style service definitions for component data management.
- **UI screens/forms** (`widget/`)  
  XML screen and form definitions for interacting with records.
- **Webapp config** (`webapp/relationshipmgr/WEB-INF/controller.xml`)  
  Request and view mappings for the component UI.
- **Seed/demo data** (`data/`)  
  Type, permission, security group, and demo records for local testing.

### 2) `catalog/Product Catalog.xml`
Sample OFBiz product catalog data in XML, including:
- Product catalog and category hierarchy
- Product features (RAM, storage, color)
- Virtual and variant products
- Promotion setup

## Prerequisites

- Apache OFBiz environment available locally
- Java and Gradle installed (as required by your OFBiz setup)

## Using the `relationshipmgr` Component

1. Place this repository’s `relationshipmgr` directory into your OFBiz components/plugins location.
2. Ensure OFBiz loads the component (based on your OFBiz installation conventions).
3. Start OFBiz.
4. Open the component at:
   - `/relationshipmgr`

## Notes

- This repository is assignment-focused and intentionally keeps implementation in OFBiz XML resources.
- The component README at `relationshipmgr/README.adoc` contains additional model-level details.