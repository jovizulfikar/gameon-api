package game

type IGameRepository interface {
	Find() ([]Game, error)
}
