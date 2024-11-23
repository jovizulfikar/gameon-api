package game

type Game struct {
	id           string
	name         string
	thumbnailUrl string `db:thumbnail_url`
}
