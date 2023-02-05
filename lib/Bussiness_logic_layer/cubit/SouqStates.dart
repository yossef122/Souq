abstract class Souq_states {}

class SouqIntialStates extends Souq_states{}

class GetProductLoadingState extends Souq_states{}

class GetProductSuccessState extends Souq_states{}

class GetProducterrorState extends Souq_states{
  final String error;
  GetProducterrorState(this.error);
  }

class GetProductLoadingState1 extends Souq_states{}

class GetProductSuccessState1 extends Souq_states{}

class GetProducterrorState1 extends Souq_states{
  final String error;
  GetProducterrorState1(this.error);
}

class GetProductLoadingState2 extends Souq_states{}

class GetProductSuccessState2 extends Souq_states{}

class GetProducterrorState2 extends Souq_states{
  final String error;
  GetProducterrorState2(this.error);
}

class GetProductLoadingState3 extends Souq_states{}

class GetProductSuccessState3 extends Souq_states{}

class GetProducterrorState3 extends Souq_states{
  final String error;
  GetProducterrorState3(this.error);
}

class GetProductLoadingState4 extends Souq_states{}

class GetProductSuccessState4 extends Souq_states{}

class GetProducterrorState4 extends Souq_states{
  final String error;
  GetProducterrorState4(this.error);
}

class GetProductLoadingState5 extends Souq_states{}

class GetProductSuccessState5 extends Souq_states{}

class GetProducterrorState5 extends Souq_states{
  final String error;
  GetProducterrorState5(this.error);
}

class SetFavouriteProductUserSuccessState extends Souq_states{}

class SetFavouriteProductUsererrorState extends Souq_states{
  final String error;
  SetFavouriteProductUsererrorState(this.error);
}

class SetFavouriteProductUserLoadingState extends Souq_states{}

class getFavouriteProductUserLoadingState extends Souq_states{}

class getFavouriteProductUserSuccessState extends Souq_states{}

class getFavouriteProductUsererrorState extends Souq_states{
  final String error;
  getFavouriteProductUsererrorState(this.error);
}

class DeleteFavouriteProductUserLoadingState extends Souq_states{}

class DeleteFavouriteProductUserSuccessState extends Souq_states{}

class DeleteFavouriteProductUsererrorState extends Souq_states{
  final String error;
  DeleteFavouriteProductUsererrorState(this.error);
}

class ChangeIndexState extends Souq_states{}

class ChangeIndex2State extends Souq_states{}

class changeRatingState extends Souq_states{}

class ISFavouriteEmptyState extends Souq_states{}

class SetordersProductUserSuccessState extends Souq_states{}

class SetordersProductUsererrorState extends Souq_states{
  final String error;
  SetordersProductUsererrorState(this.error);
}


class SetordersProductUserLoadingState extends Souq_states{}

class getordersProductUserLoadingState extends Souq_states{}

class getordersProductUserSuccessState extends Souq_states{}

class getordersProductUsererrorState extends Souq_states{
  final String error;
  getordersProductUsererrorState(this.error);
}

class DeleteordersProductUserLoadingState extends Souq_states{}

class DeleteordersProductUserSuccessState extends Souq_states{}

class DeleteordersProductUsererrorState extends Souq_states{
  final String error;
  DeleteordersProductUsererrorState(this.error);
}

class DeleteallordersLoadingState extends Souq_states{}

class DeleteallordersSuccessState extends Souq_states{}

class DeleteallorderserrorState extends Souq_states{
  final String error;
  DeleteallorderserrorState(this.error);
}

class ISordersEmptyState extends Souq_states{}

class ChangeNubmerOfOrderState extends Souq_states{}
