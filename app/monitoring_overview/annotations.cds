using CollectionService as service from '../../srv/collection-service';
annotate service.CollectionResults with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'tableName',
                Value : tableName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'value',
                Value : value,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Table Name',
            Value : tableName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Value',
            Value : value,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : 'Created At',
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Collection Results',
    },
);
annotate managed with {
	createdAt @UI.HiddenFilter: false;
}

annotate service.PurchasingDocResults with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Label : 'Documnet Number',
            Value : documnetNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Purchasing Document Category',
            Value : purchasingDocumentCategory,
        },
        {
            $Type : 'UI.DataField',
            Value : purchasingDocumentStatus,
            Label : 'Purchasing Document Status',
        },
    ],
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'tableName',
                Value : documnetNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'value',
                Value : purchasingDocumentCategory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'value',
                Value : purchasingDocumentStatus,
            },
        ],
    },
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View PurchasingDocResults',
    }
);

