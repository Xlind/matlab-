function tonedImage = toneMapDurand(radmap,dw,rw,dsigma,rsigma,contrast)
    %首先分离图像的baselayer和detaillayer
    radmap = log10(radmap)；
    base = navieBilateral(radmap,dw,rw,dsigma,rsigma);
    detail = radmap - base;
    logmax = max(base(:));
    logmin = min(base(:));
    compressionFactor = log10(contrast)/(logmax-logmin);
    log_absolute_scale =  logmax*compressionFactor;
    log_compressed = base * compressionFactor + detail  - log_absolute_scale;
    tonedImage = 10.^(log_compressed);     
end
