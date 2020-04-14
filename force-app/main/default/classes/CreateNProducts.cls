public class CreateNProducts {
    public static Integer funcOfCreateNProducts(integer n) {
        List<Product2> pd1 = new List<Product2>();
        Integer a,count=0;
        for(a=1;a<=n;a++)
        {
            count++;
            Product2 p1 = new Product2();
            p1.Name= 'Product'+ a;
            p1.Family= 'Toy';
            pd1.add(p1);
            
        }
        INSERT pd1;
        return count;
    }
}