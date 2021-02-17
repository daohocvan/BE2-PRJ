@foreach($subcategories as $subcategory)
    <li>
        <a  href="{{ route('category.show', $subcategory->id) }}" id="{{ $subcategory->id }}">{{ $subcategory->category_name}}</a>
    </li>
@endforeach