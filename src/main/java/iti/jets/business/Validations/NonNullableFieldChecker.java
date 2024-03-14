package iti.jets.business.Validations;
import jakarta.persistence.Column;
import java.lang.reflect.Field;

public class NonNullableFieldChecker {

    public static <T> boolean hasNullNonNullableFields(T entity) throws IllegalAccessException {
        for (Field field : entity.getClass().getDeclaredFields()) {
            Column column = field.getAnnotation(Column.class);

            if (column != null && !column.nullable()) {
                field.setAccessible(true);
                if (field.get(entity) == null) {
                    return true;
                }
            }
        }
        return false;
    }
}