ALTER TABLE
    person_discounts
ADD
    CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL);

--@block
ALTER TABLE
    person_discounts
ADD
    CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL);

ALTER TABLE
    person_discounts
ADD
    CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL);