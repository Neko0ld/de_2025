INSERT INTO asmorkalov_de2025.Room
(FloorId, `Number`, CategoryId)
SELECT 
	`Floor`.FloorId,
	`Номерной_фонд`.Номер,
	`Category`.CategoryId
FROM 
	`asmorkalov_de2025`.`Floor`,
	`asmorkalov_de2025`.`Category`,
	`asmorkalov_de2025`.`Номерной_фонд`
WHERE 
	Floor.Title = `Номерной_фонд`.Этаж AND 
	Category.Title = `Номерной_фонд`.Категория;