using AdminService as service from '../../srv/services';
annotate service.Cursos with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'NombreAsignatura',
                Value : NombreAsignatura,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MaxEstudiantes',
                Value : MaxEstudiantes,
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
            Label : 'NombreAsignatura',
            Value : NombreAsignatura,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MaxEstudiantes',
            Value : MaxEstudiantes,
        },
    ],
);

