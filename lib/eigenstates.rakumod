proto sub eigenstates(|) is export {*}
multi sub eigenstates(Junction:D $junction --> List:D) {
    use nqp;
    nqp::p6bindattrinvres(
      nqp::create(List),
      List,
      '$!reified',
      nqp::getattr($junction,Junction,'$!eigenstates')
    )
}
multi sub eigenstates(Mu \object --> List:D) {
    (object,)
}

# vim: expandtab shiftwidth=4
